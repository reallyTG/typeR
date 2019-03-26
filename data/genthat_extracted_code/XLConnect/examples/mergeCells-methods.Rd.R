library(XLConnect)


### Name: mergeCells-methods
### Title: Merging cells
### Aliases: mergeCells mergeCells-methods
###   mergeCells,workbook,character-method
###   mergeCells,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("mergeCells.xlsx", create = TRUE)

# Create a worksheet called 'merge'
createSheet(wb, name = "merge")

# Merge the cells A1:B8 on the worksheet created above
mergeCells(wb, sheet = "merge", reference = "A1:B8")

# Save workbook
saveWorkbook(wb)



