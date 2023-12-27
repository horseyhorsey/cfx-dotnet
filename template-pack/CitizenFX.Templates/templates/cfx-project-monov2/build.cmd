@echo off
pushd Client
dotnet publish -c Release
popd

pushd Server
dotnet publish -c Release
popd

rmdir /s /q dist
mkdir dist

copy /y fxmanifest.lua dist
xcopy /y /e Client\bin\Release\net7.0\publish dist\Client\bin\Release\net7.0\publish\
xcopy /y /e Server\bin\Release\net7.0\publish dist\Server\bin\Release\net7.0\publish\