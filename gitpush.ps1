function Push-Master {
    param(
        [string]$GitRepoName,
        [string]$CommitMessage,
        [string]$BranchName
    )
    Write-Information "Make sure you are firing this from right directory" -InformationAction Continue
        git add .
        git pull origin master
        git commit -m $CommitMessage
        git push origin $BranchName
}

function Start{
    param (
        [string]$default 
    )
        if(($default -like "*yeah*") -or ($default -like "*yes*")){
            Push-Master -GitRepoName "MKSAutoScripts" -CommitMessage "Update fixes" -BranchName "master"
        }
        else{
                Write-Information "Enter repo name" -InformationAction Continue
                $GitRepoName = Read-Host
                Write-Information "Enter Commit Message" -InformationAction Continue
                $CommitMessage = Read-Host
                Write-Information "Enter name of branch" -InformationAction Continue
                $BranchName = Read-Host
                Push-Master -GitRepoName $GitRepoName -CommitMessage $CommitMessage -BranchName $BranchName
            }
}
Write-Information "your legendary style" -InformationAction Continue
    $default = Read-Host
Start -default $default
