$verPre = "2.1.1.1";
$ver = "3.1";

Get-ChildItem 'src\**\AssemblyInfo.cs' -Recurse | ForEach-Object -Process {
    (Get-Content $_) `
        -replace 'version="(\d+)(\.\d+)(\.\d+)(?:(?:\.\d+)?|(\-\w+)?)?"', ('version="' + $verPre + '"')`
        -replace 'AssemblyVersion."(\d+)(\.\d+)(\.\d+)(?:(?:\.\d+)?|(\-\w+)?)?"', ('AssemblyVersion("' + $ver + '"')`
        -replace 'AssemblyFileVersion."(\d+)(\.\d+)(\.\d+)(?:(?:\.\d+)?|(\-\w+)?)?"', ('AssemblyFileVersion("' + $ver + '"')`
        -replace 'AssemblyInformationalVersion."(\d+)(\.\d+)(\.\d+)(?:(?:\.\d+)?|(\-\w+)?)?"', ('AssemblyInformationalVersion("' + $verPre + '"')`
    | Out-File $_ -Encoding utf8
}