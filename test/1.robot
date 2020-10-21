*** Settings ***
Library  Csv.py
Library  SeleniumLibrary
*** Variables ***
${input data}  //*[@id="tsf"]/div[2]/div[1]/div[1]/div/div[2]/input
*** Keywords ***
Get CSV Data
    [Arguments]  ${FilePath}
    ${Data} =  read csv file  ${FilePath}
    [Return]  ${Data}
Invalid login
    [Arguments]   ${h}
    input text  ${input data}  ${h[0]}
    Press Keys  ${input data}  RETURN
    sleep  5s
    Go Back
*** Test Cases ***
case1
    Open Browser  https://www.google.com/  gc
    Maximize Browser Window
    sleep  10s
case2
  ${ValidSigninScenrios}  Get CSV Data  C:\\Users\\Farookh\\PycharmProjects\\excel\\test\\excel.csv
   :FOR  ${SigninScenario}  IN  @{ValidSigninScenrios}
    \   Invalid login  ${SigninScenario}
case3
     close browser
