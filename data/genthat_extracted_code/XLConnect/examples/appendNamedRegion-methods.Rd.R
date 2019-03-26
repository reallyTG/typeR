library(XLConnect)


### Name: appendNamedRegion-methods
### Title: Appending data to a named region
### Aliases: appendNamedRegion appendNamedRegion-methods
###   appendNamedRegion,workbook-method
###   appendNamedRegion,workbook,ANY-method
### Keywords: methods IO

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Append mtcars data set to named region named 'mtcars'
appendNamedRegion(wb, mtcars, name = "mtcars")



