@echo off
rem ============================================================================
rem Copyright 2020 Intel Corporation
rem
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem
rem     http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.
rem ============================================================================

if /I %1 == html goto :html
if /I %1 == doxygen goto :doxygen
if /I %1 == parse-doxygen goto :parse-doxygen
if /I %1 == clean goto :clean

:html
python3 rst_examples.py
sphinx-build -M html source build -q
goto :eof

:doxygen
pushd "doxygen/oneapi"
doxygen
popd
goto :eof

:parse-doxygen
if not exist build mkdir build
goto :eof

:clean
rd /s /q build
goto :eof
