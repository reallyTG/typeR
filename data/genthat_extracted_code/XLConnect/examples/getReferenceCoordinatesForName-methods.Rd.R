library(XLConnect)


### Name: getReferenceCoordinatesForName-methods
### Title: Querying the coordinates of the range reference by an Excel name
### Aliases: getReferenceCoordinatesForName
###   getReferenceCoordinatesForName-methods
###   getReferenceCoordinatesForName,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query reference coordinate for name 'mtcars'
print(getReferenceCoordinatesForName(wb, name = "mtcars"))



