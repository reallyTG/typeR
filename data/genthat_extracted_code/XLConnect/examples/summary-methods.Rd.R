library(XLConnect)


### Name: summary-methods
### Title: Summarizing workbook objects
### Aliases: summary summary-methods summary,workbook-method
### Keywords: methods print utilities

### ** Examples

# Load existing demo Excel file 'mtcars.xlsx' from the XLConnect package
wb.mtcars <- loadWorkbook(system.file("demoFiles/mtcars.xlsx", 
                          package = "XLConnect"))

# Print a workbook summary
summary(wb.mtcars)



