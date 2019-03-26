library(XLConnect)


### Name: getLastColumn-methods
### Title: Querying the last (non-empty) column on a worksheet
### Aliases: getLastColumn getLastColumn-methods
###   getLastColumn,workbook,character-method
###   getLastColumn,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query the last row of the 'mtcars' worksheet
getLastColumn(wb, "mtcars")

# Query the last row of the 'mtcars2' worksheet
getLastColumn(wb, "mtcars2")

# Query the last row of the 'mtcars3' worksheet
getLastColumn(wb, "mtcars3")



