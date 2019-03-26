library(xlsx)


### Name: Workbook
### Title: Functions to manipulate Excel 2007 workbooks.
### Aliases: Workbook createWorkbook loadWorkbook saveWorkbook

### ** Examples


wb <- createWorkbook()

# see all the available java methods that you can call
#.jmethods(wb)

# for example
wb$getNumberOfSheets()   # no sheet yet!

# loadWorkbook("C:/Temp/myFile.xls")




