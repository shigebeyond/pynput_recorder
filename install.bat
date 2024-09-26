@echo off
setlocal
echo '卸载'
pip3 uninstall pynput_recorder -y

echo '清理旧包'
rmdir /s/q dist

echo '打新包'
python setup.py sdist bdist_wheel

echo '安装到本地'
:: 查找并安装所有的.whl文件
for /r %%i in (dist\*.whl) do (
    echo 安装 %%~nxi
    pip3 install "%%i"
)
endlocal