library(XLConnect)


### Name: getBoundingBox-methods
### Title: Querying the coordinates of a worksheet bounding box
### Aliases: getBoundingBox getBoundingBox-methods
###   getBoundingBox,workbook,character-method
###   getBoundingBox,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# multiregion xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/multiregion.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query bounding box for the second sheet
print(getBoundingBox(wb, sheet="SecondSheet"))

# Query bounding box for the first sheet, selecting the columns from 5 to 8
print(getBoundingBox(wb, sheet="FirstSheet", startCol=5, endCol=8))



