library(XLConnect)


### Name: getForceFormulaRecalculation-methods
### Title: Querying the coordinates of the range reference by an Excel name
### Aliases: getForceFormulaRecalculation
###   getForceFormulaRecalculation-methods
###   getForceFormulaRecalculation,workbook,character-method
###   getForceFormulaRecalculation,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Ask whether Excel will automatically recalculate formulas on sheet mtcars
print(getForceFormulaRecalculation(wb, sheet = "mtcars"))



