library(XLConnect)


### Name: removePane-methods
### Title: Removing panes from worksheet
### Aliases: removePane removePane-methods
###   removePane,workbook,character-method
###   removePane,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("removePaneTest.xlsx", create = TRUE)

# Create a worksheet named 'Sheet1'
createSheet(wb, name = "Sheet1")

# Create a split pane on Sheet1, with coordinates (10000, 5000) expressed as 1/20th of a point,
# 10 (-> J) as left column visible in right pane and 10 as top row visible in bottom pane 
createSplitPane(wb, "Sheet1", 10000, 5000, 10, 10)

# Remove the split pane from Sheet1
removePane(wb, "Sheet1")

# Save workbook (this actually writes the file to disk). Now the workbook has no split pane.
saveWorkbook(wb)



