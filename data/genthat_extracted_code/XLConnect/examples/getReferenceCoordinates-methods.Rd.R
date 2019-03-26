library(XLConnect)


### Name: getReferenceCoordinates-methods
### Title: Querying the coordinates of the range reference by an Excel name
### Aliases: getReferenceCoordinates getReferenceCoordinates-methods
###   getReferenceCoordinates,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query reference coordinate for name 'mtcars'
print(getReferenceCoordinatesForName(wb, name = "mtcars"))



