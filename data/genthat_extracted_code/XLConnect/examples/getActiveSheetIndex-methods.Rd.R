library(XLConnect)


### Name: getActiveSheetIndex-methods
### Title: Querying the active worksheet index
### Aliases: getActiveSheetIndex getActiveSheetIndex-methods
###   getActiveSheetIndex,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query the active sheet index
activeSheet <- getActiveSheetIndex(wb)



