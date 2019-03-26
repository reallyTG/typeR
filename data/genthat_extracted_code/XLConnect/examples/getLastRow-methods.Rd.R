library(XLConnect)


### Name: getLastRow-methods
### Title: Querying the last (non-empty) row on a worksheet
### Aliases: getLastRow getLastRow-methods
###   getLastRow,workbook,character-method
###   getLastRow,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query the last row of the 'mtcars' worksheet
getLastRow(wb, "mtcars")

# Query the last row of the 'mtcars2' worksheet
getLastRow(wb, "mtcars2")

# Query the last row of the 'mtcars3' worksheet
getLastRow(wb, "mtcars3")



