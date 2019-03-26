library(XLConnect)


### Name: show-methods
### Title: Display a workbook object
### Aliases: show show-methods show,workbook-method
### Keywords: methods print

### ** Examples

# Load existing demo Excel file 'mtcars.xlsx' from the XLConnect package
wb.mtcars <- loadWorkbook(system.file("demoFiles/mtcars.xlsx", 
                          package = "XLConnect"))

# Display the wb.mtcars object
wb.mtcars

# Alternatively, show can be called explicitely
show(wb.mtcars)



