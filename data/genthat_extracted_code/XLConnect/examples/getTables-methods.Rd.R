library(XLConnect)


### Name: getTables-methods
### Title: Querying available Excel tables in a workbook
### Aliases: getTables getTables-methods getTables,workbook,numeric-method
###   getTables,workbook,character-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query available tables (table names) on sheet 'mtcars_table'
tables <- getTables(wb, sheet = "mtcars_table")

# ... or via sheet index
tables <- getTables(wb, sheet = 4)



