@echo off
chcp 65001 > nul

:: Проверка прав администратора
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Запустите этот файл от имени Администратора!
    pause
    exit /b
)

:MENU
cls
echo ===========================================
echo     Управление клавиатурой ноутбука
echo ===========================================
echo 1. Отключить встроенную клавиатуру
echo 2. Включить встроенную клавиатуру
echo 3. Выход
echo ===========================================
set /p choice="Выберите действие (1, 2 или 3): "

if "%choice%"=="1" goto DISABLE
if "%choice%"=="2" goto ENABLE
if "%choice%"=="3" exit /b
goto MENU

:DISABLE
echo.
echo Отключение встроенной клавиатуры...
sc config i8042prt start= disabled
echo.
echo [!] Клавиатура отключена.
echo Изменения вступят в силу ПОСЛЕ ПЕРЕЗАГРУЗКИ.
echo Внешние USB-клавиатуры продолжат работать.
echo.
pause
exit /b

:ENABLE
echo.
echo Включение встроенной клавиатуры...
sc config i8042prt start= auto
echo.
echo [OK] Служба клавиатуры восстановлена.
echo Изменения вступят в силу ПОСЛЕ ПЕРЕЗАГРУЗКИ.
echo.
pause
exit /b