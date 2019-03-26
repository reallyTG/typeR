library(XLConnect)


### Name: removeSheet-methods
### Title: Removing worksheets from workbooks
### Aliases: removeSheet removeSheet-methods
###   removeSheet,workbook,character-method
###   removeSheet,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
mtcarsFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(mtcarsFile)

# Remove the worksheet called 'mtcars' from the above file
removeSheet(wb, sheet = "mtcars")



