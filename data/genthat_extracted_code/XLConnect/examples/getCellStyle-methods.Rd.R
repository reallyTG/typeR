library(XLConnect)


### Name: getCellStyle-methods
### Title: Retrieving named cell styles
### Aliases: getCellStyle getCellStyle-methods getCellStyle,workbook-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("getCellstyles.xlsx", create = TRUE)

# You wouldn't usually ignore the return value here...
createCellStyle(wb, 'Header')

# ... but if you did it doesn't hurt.
cs <- getCellStyle(wb, 'Header')

# Specify the cell style to use a solid foreground color
setFillPattern(cs, fill = XLC$"FILL.SOLID_FOREGROUND")

# Specify the foreground color to be used
setFillForegroundColor(cs, color = XLC$"COLOR.RED")




