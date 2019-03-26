library(XLConnect)


### Name: setSheetColor-methods
### Title: Setting colors on worksheet tabs
### Aliases: setSheetColor setSheetColor-methods
###   setSheetColor,workbook,character-method
###   setSheetColor,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("sheetcolor.xlsx", create = TRUE)

# Create a worksheet named 'Sheet1'
createSheet(wb, name = "Sheet1")

# Set the "Sheet1" tab color as red
setSheetColor(wb, "Sheet1", XLC$COLOR.RED)

# Create a worksheet named 'Sheet2'
createSheet(wb, name = "Sheet2")

# Set the tab color of the second workbook sheet as green
setSheetColor(wb, 2, XLC$COLOR.GREEN)

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



