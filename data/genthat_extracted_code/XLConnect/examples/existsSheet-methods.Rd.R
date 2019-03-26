library(XLConnect)


### Name: existsSheet-methods
### Title: Checking for existence of worksheets in a workbook
### Aliases: existsSheet existsSheet-methods existsSheet,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Check for existence of a worksheet called 'mtcars'
existsSheet(wb, "mtcars")



