::    Licensed under the Apache License, Version 2.0 (the "License");
::    you may not use this file except in compliance with the License.
::    You may obtain a copy of the License at
::
::        http://www.apache.org/licenses/LICENSE-2.0
::
::    Unless required by applicable law or agreed to in writing, software
::    distributed under the License is distributed on an "AS IS" BASIS,
::    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
::    See the License for the specific language governing permissions and
::    limitations under the License.

::
:: Script that builds JFreeChart graphs and generates a page with resulted graphs.
::

@echo off

set SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%SCRIPT_DIR:~0,-1%

if not defined JAVA_HOME (
    echo ERROR: JAVA_HOME environment variable is not found.
    echo Please point JAVA_HOME variable to location of JDK 1.7 or JDK 1.8.
    echo You can also download latest JDK at http://java.com/download
    exit /b
)

if not exist "%JAVA_HOME%\bin\java.exe" (
    echo ERROR: JAVA is not found in JAVA_HOME=$JAVA_HOME.
    echo Please point JAVA_HOME variable to installation of JDK 1.7 or JDK 1.8.
    echo You can also download latest JDK at http://java.com/download
    exit /b
)


set ARGS=%*

set CP=%CP%;%SCRIPT_DIR%\..\libs\*

::
:: JVM options. See http://java.sun.com/javase/technologies/hotspot/vmoptions.jsp for more details.
::
:: ADD YOUR/CHANGE ADDITIONAL OPTIONS HERE
::
if not defined JVM_OPTS set JVM_OPTS=-Xmx1g

::
:: Assertions are disabled by default.
:: If you want to enable them - set 'ENABLE_ASSERTIONS' flag to '1'.
::
set ENABLE_ASSERTIONS="0"

::
:: Set '-ea' options if assertions are enabled.
::
if %ENABLE_ASSERTIONS% == "1" set JVM_OPTS=%JVM_OPTS% -ea

set MAIN_CLASS=org.yardstickframework.report.jfreechart.JFreeChartGraphPlotter

"%JAVA_HOME%\bin\java.exe" %JVM_OPTS% -cp %CP% %MAIN_CLASS% %ARGS%
