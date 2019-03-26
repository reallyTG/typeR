library(xlsx)


### Name: Comment
### Title: Functions to manipulate cell comments.
### Aliases: Comment createCellComment getCellComment removeCellComment

### ** Examples


  wb <- createWorkbook()
  sheet1 <- createSheet(wb, "Sheet1")
  rows   <- createRow(sheet1, rowIndex=1:10)     # 10 rows
  cells  <- createCell(rows, colIndex=1:8)       # 8 columns

  cell1 <- cells[[1,1]]
  setCellValue(cell1, 1)   # add value 1 to cell A1

  # create a cell comment
  createCellComment(cell1, "Cogito", author="Descartes")
  

  # extract the comments 
  comment <- getCellComment(cell1)
  stopifnot(comment$getAuthor()=="Descartes")
  stopifnot(comment$getString()$toString()=="Cogito")

  # don't forget to save your workbook!



