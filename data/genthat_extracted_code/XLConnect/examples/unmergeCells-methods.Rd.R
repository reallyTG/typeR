library(XLConnect)


### Name: unmergeCells-methods
### Title: Unmerging cells
### Aliases: unmergeCells unmergeCells-methods
###   unmergeCells,workbook,character-method
###   unmergeCells,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("unmergeCells.xlsx", create = TRUE)

# Create a worksheet called 'merge'
createSheet(wb, name = "merge")

# Merge the cells A1:B8 on the worksheet created above
mergeCells(wb, sheet = "merge", reference = "A1:B8")

# Unmerge the cells A1:B8
unmergeCells(wb, sheet = "merge", reference = "A1:B8")



