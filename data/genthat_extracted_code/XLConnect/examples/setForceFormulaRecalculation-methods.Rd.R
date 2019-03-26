library(XLConnect)


### Name: setForceFormulaRecalculation-methods
### Title: Forcing Excel to recalculate formula values when opening a
###   workbook
### Aliases: setForceFormulaRecalculation
###   setForceFormulaRecalculation-methods
###   setForceFormulaRecalculation,workbook,character-method
###   setForceFormulaRecalculation,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Tell Excel to automatically recalculate formulas on sheet mtcars
setForceFormulaRecalculation(wb, sheet = "mtcars", TRUE)
# The same with a numerical sheet index
setForceFormulaRecalculation(wb, sheet = 1, TRUE)



