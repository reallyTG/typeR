library(XLConnect)


### Name: renameSheet-methods
### Title: Renaming worksheets from workbooks
### Aliases: renameSheet renameSheet-methods
###   renameSheet,workbook,character-method
###   renameSheet,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
mtcarsFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(mtcarsFile)

# Rename the worksheet called 'mtcars' from the above file to 'MyCars'
renameSheet(wb, sheet = "mtcars", newName = "MyCars")



