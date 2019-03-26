library(openxlsx)


### Name: loadWorkbook
### Title: Load an existing .xlsx file
### Aliases: loadWorkbook

### ** Examples

## load existing workbook from package folder
wb <- loadWorkbook(file = system.file("loadExample.xlsx", package= "openxlsx"))
names(wb)  #list worksheets
wb ## view object
## Add a worksheet
addWorksheet(wb, "A new worksheet")

## Save workbook
saveWorkbook(wb, "loadExample.xlsx", overwrite = TRUE)



