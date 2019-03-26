library(XLConnect)


### Name: setColumnWidth-methods
### Title: Setting the width of a column in a worksheet
### Aliases: setColumnWidth setColumnWidth-methods
###   setColumnWidth,workbook,character-method
###   setColumnWidth,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
mtcarsFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(mtcarsFile)

# Sets the column width of the 3rd column on sheet 'mtcars' 
# to 4000/256th (= 15.625) character width
setColumnWidth(wb, sheet = "mtcars", column = 3, width = 4000)



