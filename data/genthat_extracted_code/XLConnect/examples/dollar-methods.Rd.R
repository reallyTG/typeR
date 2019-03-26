library(XLConnect)


### Name: $-methods
### Title: Executing workbook methods in object$method(...) form
### Aliases: $ $-methods $,workbook-method $,cellstyle-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("dollar.xlsx", create = TRUE)

# Create a worksheet called 'CO2'
wb$createSheet(name = "CO2")

# Write built-in data set 'CO2' to the worksheet created above
wb$writeWorksheet(CO2, sheet = "CO2", startRow = 4, startCol = 2)

# Save workbook
wb$saveWorkbook()



