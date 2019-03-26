library(xlsx)


### Name: Cell
### Title: Functions to manipulate cells.
### Aliases: Cell createCell getCells setCellValue getCellValue

### ** Examples


file <- system.file("tests", "test_import.xlsx", package = "xlsx")

wb <- loadWorkbook(file)  
sheets <- getSheets(wb)

sheet <- sheets[['mixedTypes']]      # get second sheet
rows  <- getRows(sheet)   # get all the rows

cells <- getCells(rows)   # returns all non empty cells

values <- lapply(cells, getCellValue) # extract the values

# write the months of the year in the first column of the spreadsheet
ind <- paste(2:13, ".2", sep="")
mapply(setCellValue, cells[ind], month.name)

####################################################################
# make a new workbook with one sheet and 5x5 cells
wb <- createWorkbook()
sheet <- createSheet(wb, "Sheet1")
rows  <- createRow(sheet, rowIndex=1:5)
cells <- createCell(rows, colIndex=1:5) 

# populate the first column with Dates
days <- seq(as.Date("2013-01-01"), by="1 day", length.out=5)
mapply(setCellValue, cells[,1], days)

 




