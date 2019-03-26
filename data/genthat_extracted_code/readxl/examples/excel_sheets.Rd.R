library(readxl)


### Name: excel_sheets
### Title: List all sheets in an excel spreadsheet
### Aliases: excel_sheets

### ** Examples

excel_sheets(readxl_example("datasets.xlsx"))
excel_sheets(readxl_example("datasets.xls"))

# To load all sheets in a workbook, use lapply
path <- readxl_example("datasets.xls")
lapply(excel_sheets(path), read_excel, path = path)



