library(XLConnect)


### Name: writeWorksheetToFile
### Title: Writing data to worksheets in an Excel file (wrapper function)
### Aliases: writeWorksheetToFile
### Keywords: IO

### ** Examples

# multiregion xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/multiregion.xlsx",
                             package = "XLConnect")

# create a copy of the template
template <- "template-ws.xlsx"
file.copy(demoExcelFile, template) 

# Write single data.frame to a specified location in an existing file
writeWorksheetToFile(template, data=iris, sheet="FirstSheet",
                     startRow=9, startCol = 9)

# create a copy of the template
template <- "template-multi-ws.xlsx"

# Write a few copies of the data.frame all over a new file
writeWorksheetToFile(template, data = list(i1 = iris, i2 = iris, i3 = iris),
                     sheet = c("FirstSheet", "SecondSheet", "FirstSheet"),
                     startRow = c(1,101,201), startCol = c(1,11,21))




