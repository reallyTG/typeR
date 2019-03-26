library(XLConnect)


### Name: setDataFormat-methods
### Title: Specifying custom data formats for cell styles
### Aliases: setDataFormat setDataFormat-methods
###   setDataFormat,cellstyle-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("setDataFormat.xlsx", create = TRUE)

# Create a worksheet
createSheet(wb, name = "cellstyles")

# Create a dummy data set with the current date/time (as POSIXct)
now <- data.frame(Now = Sys.time())

# Write the value to the 'cellstyles' worksheet in the top left 
# corner (cell A1)
writeWorksheet(wb, now, sheet = "cellstyles", startRow = 1, 
               startCol = 1, header = FALSE)

# Create a custom anonymous cell style
cs <- createCellStyle(wb)

# Specify a custom data format
setDataFormat(cs, format = "dddd d-m-yyyy h:mm AM/PM")

# Set the cell style created above for the top left cell (A1) in 
# the 'cellstyles' worksheet
setCellStyle(wb, sheet = "cellstyles", row = 1, col = 1, cellstyle = cs)

# Set column width to display whole time/date string
setColumnWidth(wb, sheet = "cellstyles", column = 1, width = 6000)

# Save the workbook
saveWorkbook(wb)



