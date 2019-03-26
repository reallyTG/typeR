library(XLConnect)


### Name: getDefinedNames-methods
### Title: Retrieving defined names in a workbook
### Aliases: getDefinedNames getDefinedNames-methods
###   getDefinedNames,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
mtcarsFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(mtcarsFile)

# Retrieve defined names with valid references
getDefinedNames(wb)



