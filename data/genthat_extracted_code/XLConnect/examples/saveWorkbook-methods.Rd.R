library(XLConnect)


### Name: saveWorkbook-methods
### Title: Saving Microsoft Excel workbooks
### Aliases: saveWorkbook saveWorkbook-methods
###   saveWorkbook,workbook,missing-method
###   saveWorkbook,workbook,character-method
### Keywords: methods file

### ** Examples

# Create a new workbook 'saveMe.xlsx'
# (assuming the file to not exist already)
wb <- loadWorkbook("saveMe.xlsx", create = TRUE)

# Create a worksheet called 'mtcars'
createSheet(wb, name = "mtcars")

# Write built-in dataset 'mtcars' to sheet 'mtcars' created above
writeWorksheet(wb, mtcars, sheet = "mtcars")

# Save workbook - this actually writes the file 'saveMe.xlsx' to disk
saveWorkbook(wb)



