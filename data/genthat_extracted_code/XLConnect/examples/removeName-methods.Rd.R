library(XLConnect)


### Name: removeName-methods
### Title: Removing names from workbooks
### Aliases: removeName removeName-methods removeName,workbook-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of package XLConnect
mtcarsFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(mtcarsFile)

# Remove the named region called 'mtcars' from the above file
# (this named region is defined as 'mtcars!$A$1:$K$33')
removeName(wb, name = "mtcars")



