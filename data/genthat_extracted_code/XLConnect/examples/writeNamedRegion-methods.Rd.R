library(XLConnect)


### Name: writeNamedRegion-methods
### Title: Writing named regions to a workbook
### Aliases: writeNamedRegion writeNamedRegion-methods
###   writeNamedRegion,workbook-method writeNamedRegion,workbook,ANY-method
### Keywords: methods IO

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("writeNamedRegion.xlsx", create = TRUE)

# Create a worksheet named 'mtcars'
createSheet(wb, name = "mtcars")

# Create a named region called 'mtcars' on the sheet called 'mtcars'
createName(wb, name = "mtcars", formula = "mtcars!$A$1")

# Write built-in data set 'mtcars' to the above defined named region
# (using header = TRUE)
writeNamedRegion(wb, mtcars, name = "mtcars")

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



