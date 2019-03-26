library(XLConnect)


### Name: createSheet-methods
### Title: Creating worksheets in a workbook
### Aliases: createSheet createSheet-methods createSheet,workbook-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("createSheet.xlsx", create = TRUE)

# Create a worksheet called 'CO2'
createSheet(wb, name = "CO2")

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



