library(XLConnect)


### Name: appendWorksheet-methods
### Title: Appending data to worksheets
### Aliases: appendWorksheet appendWorksheet-methods
###   appendWorksheet,workbook,ANY,character-method
###   appendWorksheet,workbook,ANY,numeric-method
### Keywords: methods IO

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Append mtcars data set to worksheet named 'mtcars'
appendWorksheet(wb, mtcars, sheet = "mtcars")



