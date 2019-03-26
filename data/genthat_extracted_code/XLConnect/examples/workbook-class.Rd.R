library(XLConnect)


### Name: workbook-class
### Title: Class "workbook"
### Aliases: workbook-class
### Keywords: classes

### ** Examples

# Create a new workbook 'myWorkbook.xlsx' 
# (assuming the file to not exist already)
wb <- loadWorkbook("myWorkbook.xlsx", create = TRUE)

# Create a worksheet called 'mtcars'
createSheet(wb, name = "mtcars")

# Write built-in dataset 'mtcars' to sheet 'mtcars' created above
writeWorksheet(wb, mtcars, sheet = "mtcars")

# Save workbook - this actually writes the file 'myWorkbook.xlsx' to disk
saveWorkbook(wb)



