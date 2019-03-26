library(openxlsx)


### Name: removeRowHeights
### Title: Remove custom row heights from a worksheet
### Aliases: removeRowHeights

### ** Examples

## Create a new workbook
wb <- loadWorkbook(file = system.file("loadExample.xlsx", package = "openxlsx"))

## remove any custom row heights in rows 1 to 10
removeRowHeights(wb, 1, rows = 1:10)
saveWorkbook(wb, "removeRowHeightsExample.xlsx", overwrite = TRUE)



