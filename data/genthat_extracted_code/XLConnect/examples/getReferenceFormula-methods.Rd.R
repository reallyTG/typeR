library(XLConnect)


### Name: getReferenceFormula-methods
### Title: Querying reference formulas of Excel names
### Aliases: getReferenceFormula getReferenceFormula-methods
###   getReferenceFormula,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query reference formula for name 'mtcars'
print(getReferenceFormula(wb, name = "mtcars"))



