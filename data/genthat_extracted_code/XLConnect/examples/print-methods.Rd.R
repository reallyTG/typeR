library(XLConnect)


### Name: print-methods
### Title: Print a workbook's filename
### Aliases: print print-methods print,workbook-method
### Keywords: methods print

### ** Examples

# Load existing demo Excel file 'mtcars.xlsx' from the XLConnect package
wb.mtcars <- loadWorkbook(system.file("demoFiles/mtcars.xlsx", 
                          package = "XLConnect"))

# Print the workbook's underlying filename
print(wb.mtcars)



