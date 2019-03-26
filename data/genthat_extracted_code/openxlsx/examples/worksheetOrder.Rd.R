library(openxlsx)


### Name: worksheetOrder
### Title: Order of worksheets in xlsx file
### Aliases: worksheetOrder worksheetOrder<-

### ** Examples

## setup a workbook with 3 worksheets
wb <- createWorkbook()
addWorksheet(wb = wb, sheetName = "Sheet 1", gridLines = FALSE)
writeDataTable(wb = wb, sheet = 1, x = iris)

addWorksheet(wb = wb, sheetName = "mtcars (Sheet 2)", gridLines = FALSE)
writeData(wb = wb, sheet = 2, x = mtcars)

addWorksheet(wb = wb, sheetName = "Sheet 3", gridLines = FALSE)
writeData(wb = wb, sheet = 3, x = Formaldehyde)

worksheetOrder(wb)
names(wb)
worksheetOrder(wb) <- c(1,3,2) # switch position of sheets 2 & 3 
writeData(wb, 2, 'This is still the "mtcars" worksheet', startCol = 15)
worksheetOrder(wb)
names(wb)  ## ordering within workbook is not changed

saveWorkbook(wb, "worksheetOrderExample.xlsx",  overwrite = TRUE)
worksheetOrder(wb) <- c(3,2,1)
saveWorkbook(wb, "worksheetOrderExample2.xlsx",  overwrite = TRUE)



