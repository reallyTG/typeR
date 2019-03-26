library(huxtable)


### Name: as_Workbook
### Title: Convert a huxtable for Excel
### Aliases: as_Workbook as_Workbook.huxtable

### ** Examples

wb <- as_Workbook(jams)

## Not run: 
##D   openxlsx::saveWorkbook(wb,
##D         "my-excel-file.xlsx")
## End(Not run)

# multiple sheets in a single workbook:
wb <- openxlsx::createWorkbook()
wb <- as_Workbook(jams,
      Workbook = wb, sheet = "sheet1")
wb <- as_Workbook(
      hux("Another", "huxtable"),
      Workbook = wb,
      sheet = "sheet2")



