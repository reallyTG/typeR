library(XLConnect)


### Name: loadWorkbook
### Title: Loading Microsoft Excel workbooks
### Aliases: loadWorkbook
### Keywords: file

### ** Examples

# Load existing demo Excel file 'mtcars.xlsx' from the XLConnect package
wb.mtcars <- loadWorkbook(system.file("demoFiles/mtcars.xlsx", 
                          package = "XLConnect"))

# Create new workbook
wb.new <- loadWorkbook("myNewExcelFile.xlsx", create = TRUE)

# NOTE: The above statement does not write the file to disk! 
# saveWorkbook(wb.new) would need to be called in order to write/save 
# the file to disk!



