library(xlsx)


### Name: addHyperlink
### Title: Add a hyperlink to a cell.
### Aliases: addHyperlink

### ** Examples


  wb <- createWorkbook()
  sheet1 <- createSheet(wb, "Sheet1")
  rows   <- createRow(sheet1, 1:10)              # 10 rows
  cells  <- createCell(rows, colIndex=1:8)       # 8 columns

  cat("Add hyperlinks to a cell")
  cell <- cells[[1,1]]
  address <- "http://poi.apache.org/"
  setCellValue(cell, "click me!")  
  addHyperlink(cell, address)
  
  # Don't forget to save the workbook ...  
 



