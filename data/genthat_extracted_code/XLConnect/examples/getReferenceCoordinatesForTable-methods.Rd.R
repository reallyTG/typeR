library(XLConnect)


### Name: getReferenceCoordinatesForTable-methods
### Title: Querying the coordinates of the range of an Excel table
### Aliases: getReferenceCoordinatesForTable
###   getReferenceCoordinatesForTable-methods
###   getReferenceCoordinatesForTable,workbook,numeric-method
###   getReferenceCoordinatesForTable,workbook,character-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query reference coordinates for table 'MtcarsTable' on sheet
# 'mtcars_table'
print(getReferenceCoordinatesForTable(wb, sheet = "mtcars_table", 
                                      table = "MtcarsTable"))



