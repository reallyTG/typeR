library(XLConnect)


### Name: setRowHeight-methods
### Title: Setting the height of a row in a worksheet
### Aliases: setRowHeight setRowHeight-methods
###   setRowHeight,workbook,character-method
###   setRowHeight,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
mtcarsFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(mtcarsFile)

# Sets the row height of the 1st row on sheet 'mtcars'
# to 20 points
setRowHeight(wb, sheet = "mtcars", row = 1, height = 20)



