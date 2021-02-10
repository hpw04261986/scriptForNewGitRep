# Cool PowerShell script to create new git repositories
# You have patience so here is your encrypted flag: d6640d89960251619d3035628d578891
 
param
(
  [string]$directoryPath = '.',
  [switch]$bare = $false,
  [switch]$externalGitDir = $false,
  [Alias('GitDir')]
  [string]$separateGitDirPath = ''
)

$repoPath = Resolve-Path $directoryPath

if ($separateGitDirPath -eq '')
{
  if ($externalGitDir)
  {
    $gitDirPath = $repoPath.Path + '.git'
  }
  else
  {
    $gitDirPath = ''
  }
}
else
{
  $gitDirPath = $separateGitDirPath
}

if ($gitDirPath -eq '')
{
  git init $directoryPath
}
else
{
  git init --separate-git-dir $gitDirPath $directoryPath
}
