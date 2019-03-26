library(basictabler)


### Name: TableOpenXlsxStyle
### Title: A class that specifies Excel styling as used by the openxlsx
###   package.
### Aliases: TableOpenXlsxStyle
### Keywords: datasets

### ** Examples

# This class should not be used by end users.  It is an internal class
# created only by the BasicTable class.  It is used when rendering to Excel.
library(basictabler)
tbl <- qtbl(data.frame(a=1:2, b=3:4))
library(openxlsx)
wb <- createWorkbook(creator = Sys.getenv("USERNAME"))
addWorksheet(wb, "Data")
tbl$writeToExcelWorksheet(wb=wb, wsName="Data",
                         topRowNumber=1, leftMostColumnNumber=1,
                         applyStyles=TRUE, mapStylesFromCSS=TRUE)
# Use saveWorkbook() to save the Excel file.



