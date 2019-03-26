library(openxlsx)


### Name: saveWorkbook
### Title: save Workbook to file
### Aliases: saveWorkbook

### ** Examples

## Create a new workbook and add a worksheet
wb <- createWorkbook("Creator of workbook")
addWorksheet(wb, sheetName = "My first worksheet")

## Save workbook to working directory
saveWorkbook(wb, file = "saveWorkbookExample.xlsx", overwrite = TRUE) 



