library(xlsx)


### Name: CellBlock
### Title: Create and style a block of cells.
### Aliases: CellBlock CellBlock.default CB.setColData CB.setRowData
###   CB.setMatrixData CB.setFill CB.setFont CB.setBorder is.CellBlock

### ** Examples

## Not run: 
##D   wb <- createWorkbook()
##D   sheet  <- createSheet(wb, sheetName="CellBlock")
##D 
##D   cb <- CellBlock(sheet, 7, 3, 1000, 60)
##D   CB.setColData(cb, 1:100, 1)    # set a column
##D   CB.setRowData(cb, 1:50, 1)     # set a row
##D 
##D   # add a matrix, and style it
##D   cs <- CellStyle(wb) + DataFormat("#,##0.00")
##D   x  <- matrix(rnorm(900*45), nrow=900)
##D   CB.setMatrixData(cb, x, 10, 4, cellStyle=cs)  
##D 
##D   # highlight the negative numbers in red 
##D   fill <- Fill(foregroundColor = "red", backgroundColor="red")
##D   ind  <- which(x < 0, arr.ind=TRUE)
##D   CB.setFill(cb, fill, ind[,1]+9, ind[,2]+3)  # note the indices offset
##D 
##D   # set the border on the top row of the Cell Block
##D   border <-  Border(color="blue", position=c("TOP", "BOTTOM"),
##D     pen=c("BORDER_THIN", "BORDER_THICK"))
##D   CB.setBorder(cb, border, 1:1000, 1)
##D 
##D 
##D   # Don't forget to save the workbook ...  
##D   # saveWorkbook(wb, file) 
## End(Not run)



