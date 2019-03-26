library(openxlsx)


### Name: openXL
### Title: Open a Microsoft Excel file (xls/xlsx) or an openxlsx Workbook
### Aliases: openXL

### ** Examples

# file example
example(writeData)
#openXL("writeDataExample.xlsx")

# (not yet saved) Workbook example
wb <- createWorkbook()
x <- mtcars[1:6,]
addWorksheet(wb, "Cars")
writeData(wb, "Cars", x, startCol = 2, startRow = 3, rowNames = TRUE)
#openXL(wb)




