library(XLConnect)


### Name: writeWorksheet-methods
### Title: Writing data to worksheets
### Aliases: writeWorksheet writeWorksheet-methods
###   writeWorksheet,workbook,ANY,character-method
###   writeWorksheet,workbook,ANY,numeric-method
### Keywords: methods IO

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("writeWorksheet.xlsx", create = TRUE)

# Create a worksheet called 'CO2'
createSheet(wb, name = "CO2")

# Write built-in data set 'CO2' to the worksheet created above;
# offset from the top left corner and with default header = TRUE
writeWorksheet(wb, CO2, sheet = "CO2", startRow = 4, startCol = 2)

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



