library(xlsx)


### Name: CellStyle
### Title: Functions to manipulate cells.
### Aliases: CellStyle CellStyle.default setCellStyle getCellStyle
###   is.CellStyle

### ** Examples

## Not run: 
##D   wb <- createWorkbook()
##D   sheet <- createSheet(wb, "Sheet1")
##D 
##D   rows  <- createRow(sheet, rowIndex=1)    
##D 
##D   cell.1 <- createCell(rows, colIndex=1)[[1,1]]     
##D   setCellValue(cell.1, "Hello R!")
##D 
##D   cs <- CellStyle(wb) +
##D     Font(wb, heightInPoints=20, isBold=TRUE, isItalic=TRUE,
##D       name="Courier New", color="orange") + 
##D     Fill(backgroundColor="lavender", foregroundColor="lavender",
##D       pattern="SOLID_FOREGROUND") +
##D     Alignment(h="ALIGN_RIGHT")
##D    
##D   setCellStyle(cell.1, cellStyle1)  
##D 
##D   # you need to save the workbook now if you want to see this art
## End(Not run)



