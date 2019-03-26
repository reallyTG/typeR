library(XLConnect)


### Name: setFillForegroundColor-methods
### Title: Specifying the fill foreground color for cell styles
### Aliases: setFillForegroundColor setFillForegroundColor-methods
###   setFillForegroundColor,cellstyle,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("setFillForegroundColor.xlsx", create = TRUE)

# Create a worksheet
createSheet(wb, name = "cellstyles")

# Create a custom anonymous cell style
cs <- createCellStyle(wb)

# Specify the fill background color for the cell style created above
setFillBackgroundColor(cs, color = XLC$"COLOR.CORNFLOWER_BLUE")

# Specify the fill foreground color
setFillForegroundColor(cs, color = XLC$"COLOR.YELLOW")

# Specify the fill pattern
setFillPattern(cs, fill = XLC$"FILL.BIG_SPOTS")

# Set the cell style created above for the top left cell (A1) in the
# 'cellstyles' worksheet
setCellStyle(wb, sheet = "cellstyles", row = 1, col = 1, cellstyle = cs)

# Save the workbook
saveWorkbook(wb)



