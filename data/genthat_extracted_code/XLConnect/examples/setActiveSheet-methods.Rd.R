library(XLConnect)


### Name: setActiveSheet-methods
### Title: Setting the active worksheet in a workbook
### Aliases: setActiveSheet setActiveSheet-methods
###   setActiveSheet,workbook,character-method
###   setActiveSheet,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
mtcarsFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(mtcarsFile)

# Sets the active sheet to the sheet 'mtcars3'
setActiveSheet(wb, sheet = "mtcars3")



