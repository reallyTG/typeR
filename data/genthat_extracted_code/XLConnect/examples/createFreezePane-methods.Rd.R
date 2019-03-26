library(XLConnect)


### Name: createFreezePane-methods
### Title: Creating a freeze pane on a worksheet
### Aliases: createFreezePane createFreezePane-methods
###   createFreezePane,workbook,character-method
###   createFreezePane,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("freezePaneTest.xlsx", create = TRUE)

# Create a worksheet named 'Sheet1'
createSheet(wb, name = "Sheet1")

# Create a freeze pane on Sheet1, using as reference position the 5th column and the 5th row,
# showing the 10th column as the leftmost visible one in the right pane
# and the 10th row as the top visible one in the bottom pane.
createFreezePane(wb, "Sheet1", 5, 5, 10, 10)

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



