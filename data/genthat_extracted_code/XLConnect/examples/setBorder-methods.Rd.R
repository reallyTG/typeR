library(XLConnect)


### Name: setBorder-methods
### Title: Specifying borders for cell styles
### Aliases: setBorder setBorder-methods setBorder,cellstyle-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("setBorder.xlsx", create = TRUE)

# Create a worksheet
createSheet(wb, name = "cellstyles")

# Create a custom anonymous cell style
cs <- createCellStyle(wb)

# Specify the border for the cell style created above
setBorder(cs, side = c("bottom", "right"), type = XLC$"BORDER.THICK", 
          color = c(XLC$"COLOR.BLACK", XLC$"COLOR.RED"))

# Set the cell style created above for the top left cell (A1) in the 
# 'cellstyles' worksheet
setCellStyle(wb, sheet = "cellstyles", row = 1, col = 1, cellstyle = cs)

# Save the workbook
saveWorkbook(wb)



