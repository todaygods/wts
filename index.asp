﻿<%@language=vbscript codepage=65001 %>
<%
'@title: 单入口
'@author: ekede.com
'@date: 2018-10-16
'@description: 将404,403解析到该入口

'#系统包含:
'全局唯一系统包含,避免使用系统包含,去偶合
'第一次使用,需要将inc/下的config.bak.asp手动复制为config.asp并进行配置
%>
<!--#include file="inc/config.asp"-->
<!--#include file="inc/class/load.asp"-->
<%
'##

'#根目录常量:
'入口文件相对网站根目录的位置,为空说明当前是根目录
Const PATH_ROOT = ""
'##

'#启动框架:
'仅有的全局根对象,其余全部为局部,后续包含均通过loader实现
Dim loader
Dim wts
Set loader = New Class_Load
    loader.frameworkPath=PATH_INC
Set wts = loader.LoadFramework("Wts")
    wts.Start()
    wts.Finish()
Set wts = Nothing
Set loader = Nothing
'##

'#调试程序:
'输出变量,中断
Public Sub Die(str)
    On Error Resume Next
    If typename(wts) = "Framework_Wts" Then
 	   Response.write wts.fun.Print(str)
    Else
 	   Response.write "Invalid Framework"
    End If
    If err Then Response.Write "No Start Framework"
    Response.End
End Sub
'##
%>