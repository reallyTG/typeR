library(XLConnect)


### Name: getSheets-methods
### Title: Querying available worksheets in a workbook
### Aliases: getSheets getSheets-methods getSheets,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query available worksheets
sheets <- getSheets(wb)



