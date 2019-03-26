library(openxlsx)


### Name: removeWorksheet
### Title: Remove a worksheet from a workbook
### Aliases: removeWorksheet

### ** Examples

## load a workbook 
wb <- loadWorkbook(file = system.file("loadExample.xlsx", package = "openxlsx"))

## Remove sheet 2
removeWorksheet(wb, 2)

## save the modified workbook
saveWorkbook(wb, "removeWorksheetExample.xlsx", overwrite = TRUE)



