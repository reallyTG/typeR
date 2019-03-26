library(XLConnect)


### Name: setMissingValue-methods
### Title: Setting missing value identifiers
### Aliases: setMissingValue setMissingValue-methods
###   setMissingValue,workbook-method setMissingValue,workbook,ANY-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("missingValue.xlsx", create = TRUE)

# Create a worksheet named 'airquality'
createSheet(wb, name = "airquality")

# Create a named region called 'airquality' on the sheet called
# 'airquality'
createName(wb, name = "airquality", formula = "airquality!$A$1")

# Set the missing value string to 'missing'
setMissingValue(wb, value = "missing")

# Write built-in data set 'airquality' to the above defined named region
writeNamedRegion(wb, airquality, name = "airquality")

# Save workbook
saveWorkbook(wb)



