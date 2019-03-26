library(openxlsx)


### Name: readWorkbook
### Title: Read from an Excel file or Workbook object
### Aliases: readWorkbook

### ** Examples

xlsxFile <- system.file("readTest.xlsx", package = "openxlsx")
df1 <- readWorkbook(xlsxFile = xlsxFile, sheet = 1)

xlsxFile <- system.file("readTest.xlsx", package = "openxlsx")
df1 <- readWorkbook(xlsxFile = xlsxFile, sheet = 1, rows = c(1, 3, 5), cols = 1:3)



