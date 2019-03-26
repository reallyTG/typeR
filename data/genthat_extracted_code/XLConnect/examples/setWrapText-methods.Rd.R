library(XLConnect)


### Name: setWrapText-methods
### Title: Specifying text wrapping behaviour
### Aliases: setWrapText setWrapText-methods setWrapText,cellstyle-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("setWrapText.xlsx", create = TRUE)

# Create a worksheet
createSheet(wb, name = "cellstyles")

# Create a dummy data set with some long text
text <- data.frame(
     Text = "Some very very very very very very very long text")

# Write the value to the 'cellstyles' worksheet in the 
# top left corner (cell A1)
writeWorksheet(wb, text, sheet = "cellstyles", startRow = 1, 
               startCol = 1, header = FALSE)

# Create a custom anonymous cell style
cs <- createCellStyle(wb)

# Specify to wrap the text
setWrapText(cs, wrap = TRUE)

# Set the cell style created above for the top left cell (A1) 
# in the 'cellstyles' worksheet
setCellStyle(wb, sheet = "cellstyles", row = 1, col = 1, 
             cellstyle = cs)

# Save the workbook
saveWorkbook(wb)



