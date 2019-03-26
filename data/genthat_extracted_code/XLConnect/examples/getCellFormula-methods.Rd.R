library(XLConnect)


### Name: getCellFormula-methods
### Title: Retrieving formula definitions from cells
### Aliases: getCellFormula getCellFormula-methods
###   getCellFormula,workbook,character-method
###   getCellFormula,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("cellFormula.xlsx", create = TRUE)

createSheet(wb, "Formula")

# Assign a formula to A1
setCellFormula(wb, "Formula", 1, 1, "SUM($B$1:$B$29)")

# Returns the formula for Sheet1!A1
getCellFormula(wb, "Formula", 1, 1)
# The same with a numeric sheet index
getCellFormula(wb, 1, 1, 1)



