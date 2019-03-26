library(XLConnect)


### Name: clearSheet-methods
### Title: Clearing worksheets in a workbook
### Aliases: clearSheet clearSheet-methods
###   clearSheet,workbook,numeric-method
###   clearSheet,workbook,character-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of 
# package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", 
                             package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Clear worksheets named 'mtcars' and 'mtcars2'
clearSheet(wb, sheet = c("mtcars", "mtcars2"))

# Clear 3rd worksheet
clearSheet(wb, sheet = 3) 



