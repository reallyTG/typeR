library(XLConnect)


### Name: createSplitPane-methods
### Title: Creating a split pane on a worksheet
### Aliases: createSplitPane createSplitPane-methods
###   createSplitPane,workbook,character-method
###   createSplitPane,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("splitPaneTest.xlsx", create = TRUE)

# Create a worksheet named 'Sheet1'
createSheet(wb, name = "Sheet1")

# Create a split pane on Sheet1, with coordinates (10000, 5000) expressed as 1/20th of a point,
# 10 (-> J) as left column visible in right pane and 10 as top row visible in bottom pane 
createSplitPane(wb, "Sheet1", 10000, 5000, 10, 10)

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



