library(xlsx)


### Name: Sheet
### Title: Functions to manipulate worksheets.
### Aliases: Sheet Worksheet createSheet removeSheet getSheets

### ** Examples


file <- system.file("tests", "test_import.xlsx", package = "xlsx")

wb <- loadWorkbook(file)  
sheets <- getSheets(wb)

sheet  <- sheets[[2]]  # extract the second sheet

# see all the available java methods that you can call
#.jmethods(sheet)

# for example
sheet$getLastRowNum()




