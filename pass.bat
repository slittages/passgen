@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion


for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

set "BLUE=%ESC%[94m"
set "RESET=%ESC%[0m"

set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%%^&*()-_=+"

:menu
cls

echo.
echo                               %BLUE%╔────────────────────────────────────────────────────╗%RESET%
echo                               %BLUE%│________                       _________            │%RESET%
echo                               %BLUE%│___  __ \_____ _______________ __  ____/___________ │%RESET%
echo                               %BLUE%│__  /_/ /  __ `/_  ___/_  ___/ _  / __ _  _ \_  __ \│%RESET%
echo                               %BLUE%│_  ____// /_/ /_(__  )_(__  )  / /_/ / /  __/  / / /│%RESET%
echo                               %BLUE%│/_/     \__,_/ /____/ /____/   \____/  \___//_/ /_/ │%RESET%
echo                               %BLUE%╚────────────────────────────────────────────────────╝%RESET%
echo.

echo 1. Generate password
echo 2. Exit
echo.

set /p choice=Choose: 

if "%choice%"=="2" exit
if not "%choice%"=="1" goto menu

set /p length=Password length: 

set "password="

for /L %%i in (1,1,%length%) do (
    set /a rand=!random! %% 72
    for %%A in (!rand!) do set "password=!password!!chars:~%%A,1!"
)

echo.
echo %BLUE%==============================%RESET%
echo %BLUE%Your password:%RESET%
echo %BLUE%!password!%RESET%
echo %BLUE%==============================%RESET%
echo.

echo !password! | clip
echo %BLUE%Copied to clipboard!%RESET%

pause
goto menu
