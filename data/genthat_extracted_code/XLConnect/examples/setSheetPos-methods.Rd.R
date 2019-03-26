library(XLConnect)


### Name: setSheetPos-methods
### Title: Setting worksheet position
### Aliases: setSheetPos setSheetPos-methods
###   setSheetPos,workbook,character,missing-method
###   setSheetPos,workbook,character,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Move the 'mtcars3' worksheet to the front
setSheetPos(wb, sheet = "mtcars3", pos = 1)



