# Set environment variables for Visual Studio Command Prompt
# Based on: http://stackoverflow.com/questions/2124753/how-i-can-use-powershell-with-the-visual-studio-2010-command-prompt
$version=14
pushd "c:\Program Files (x86)\Microsoft Visual Studio ${version}.0\Common7\Tools"
cmd /c "vsvars32.bat&set" |
foreach {
  if ($_ -match "=") {
    $v = $_.split("=")
    set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
popd
write-host "`nVS${version} Command Prompt variables set." -ForegroundColor Yellow
