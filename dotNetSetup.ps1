param (
  #Path to the folder were the project will be set up
  [Parameter(Mandatory, HelpMessage="Enter path to the folder were the project is setup")]
  [Alias("p")]
  [string]
  $Path,
  #Language of the project
  [Parameter(Mandatory, HelpMessage="Enter project language (C# or F#)")]
  [Alias('l')]
  [string]
  [ValidateSet("C#", "F#")]
  $Language
)

$Project = $Path + "\src\Project1"
$Tests = $Path + "\test\UnitTests"

Set-Location $Path
dotnet new classlib --language $Language --output $Project
dotnet new xunit --language "C#" --output $Tests
dotnet new sln --output $Path
dotnet sln add $Project $Tests
