library(XLConnect)


### Name: existsName-methods
### Title: Checking existence of names in a workbook
### Aliases: existsName existsName-methods existsName,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
mtcarsFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(mtcarsFile)

# Check if the name 'mtcars' exists
# (should return TRUE since the name is defined as 'mtcars!$A$1:$K$33')
existsName(wb, name = "mtcars")



