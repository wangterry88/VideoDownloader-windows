<!-- :
:: textSubmitter.bat
@echo off
for /f "tokens=1-3 delims=," %%a in ('mshta.exe "%~f0"') do (
    set "input=%%a"
    set "header=%%b"
    set "output=%%c"
)

cd /d %~dp0
cd /d .\bin\
.\ffmpeg -user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36" -headers referer:%header% -i %input% -c copy ..\video\%output%

pause
goto :EOF

-->

<html>
  <head>
    <title>M3U8 MP4 video downloader (ver3.0)</title>
      M3U8 MP4 downloader (ver3.0)<br>
  </head>
  <body>

    <script language='javascript' >
        function pipeText() {
            var input=document.getElementById('input').value;
            var header=document.getElementById('header').value;
            var output=document.getElementById('output').value;

            var Batch = new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1);
            close(Batch.WriteLine(input+','+header+','+output));
      }
    </script>

    <br>Please input the .m3u8 URL: <input type='text' name='input' size='30'></input><br>
    <br>Please input the header: <input value="www.google.com"  type='text' name='header' size='30' ></input><br>
    <br>Output name of the file (ex: test.mp4): <input type='text' name='output' size='30'></input><br>
    <hr>
    <button onclick='pipeText()'>Download</button>
  </body>
</html>