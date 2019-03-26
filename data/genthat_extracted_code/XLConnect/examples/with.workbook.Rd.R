library(XLConnect)


### Name: with.workbook
### Title: Evaluate an R expression in a workbook environment
### Aliases: with.workbook
### Keywords: IO

### ** Examples

# multiregion xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/multiregion.xlsx",
                             package = "XLConnect")

# load workbook
wb <- loadWorkbook(demoExcelFile)

# named regions: Calendar, IQ, Iris
print(getDefinedNames(wb))

# named regions as variables
with(wb, { 
  print(Calendar)
  summary(IQ)
  summary(Iris)
})



