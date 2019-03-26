library(XLConnect)


### Name: readTable
### Title: Reading Excel tables from a workbook
### Aliases: readTable readTable-methods readTable,workbook,numeric-method
###   readTable,workbook,character-method
### Keywords: methods IO

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read table 'MtcarsTable' from sheet 'mtcars_table'
data <- readTable(wb, sheet = "mtcars_table", table = "MtcarsTable")



