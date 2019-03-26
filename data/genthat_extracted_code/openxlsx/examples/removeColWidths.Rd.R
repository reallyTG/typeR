library(openxlsx)


### Name: removeColWidths
### Title: Remove column widths from a worksheet
### Aliases: removeColWidths

### ** Examples

## Create a new workbook
wb <- loadWorkbook(file = system.file("loadExample.xlsx", package = "openxlsx"))

## remove column widths in columns 1 to 20
removeColWidths(wb, 1, cols = 1:20)
saveWorkbook(wb, "removeColWidthsExample.xlsx", overwrite = TRUE)



