library(XLConnect)


### Name: setAutoFilter-methods
### Title: Setting auto-filters on worksheets
### Aliases: setAutoFilter setAutoFilter-methods
###   setAutoFilter,workbook,character-method
###   setAutoFilter,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("autofilter.xlsx", create = TRUE)

# Create a worksheet named 'mtcars'
createSheet(wb, name = "mtcars")

# Create a named region called 'mtcars' on the sheet called 'mtcars'
createName(wb, name = "mtcars", formula = "mtcars!$A$1")

# Write built-in data set 'mtcars' to the above defined named region
# (using header = TRUE)
writeNamedRegion(wb, mtcars, name = "mtcars")

# Set an auto-filter for the named region written above
setAutoFilter(wb, sheet = "mtcars", reference = aref("A1", dim(mtcars)))

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



