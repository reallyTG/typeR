library(XLConnect)


### Name: getSheetPos-methods
### Title: Querying worksheet position
### Aliases: getSheetPos getSheetPos-methods
###   getSheetPos,workbook,character-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Query worksheet positions for the worksheets 'mtcars2', 'mtcars3',
# 'mtcars' and 'NotThere' (which actually does not exist)
print(getSheetPos(wb, sheet = c("mtcars2", "mtcars3", "mtcars", "NotThere")))



