library(XLConnect)


### Name: cloneSheet-methods
### Title: Cloning/copying worksheets
### Aliases: cloneSheet cloneSheet-methods
###   cloneSheet,workbook,character-method
###   cloneSheet,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Clone the 'mtcars' worksheet and assign it the name 'mtcars cloned'
cloneSheet(wb, sheet = "mtcars", name = "mtcars cloned")



