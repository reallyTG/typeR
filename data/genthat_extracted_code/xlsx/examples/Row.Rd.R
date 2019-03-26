library(xlsx)


### Name: Row
### Title: Functions to manipulate rows of a worksheet.
### Aliases: Row createRow getRows removeRow setRowHeight

### ** Examples

file <- system.file("tests", "test_import.xlsx", package = "xlsx")

wb <- loadWorkbook(file)  
sheets <- getSheets(wb)

sheet <- sheets[[2]]  
rows  <- getRows(sheet)  # get all the rows

# see all the available java methods that you can call
#.jmethods(rows[[1]])

# for example
rows[[1]]$getRowNum()   # zero based index in Java

removeRow(sheet, rows)  # remove them all

# create some row
rows  <- createRow(sheet, rowIndex=1:5)
setRowHeight( rows, multiplier=3)  # 3 times bigger rows than the default




