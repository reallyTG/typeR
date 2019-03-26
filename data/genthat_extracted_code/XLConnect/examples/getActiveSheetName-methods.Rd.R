library(XLConnect)


### Name: getActiveSheetName-methods
### Title: Querying the active worksheet name
### Aliases: getActiveSheetName getActiveSheetName-methods
###   getActiveSheetName,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query the active sheet name
activeSheet <- getActiveSheetName(wb)



