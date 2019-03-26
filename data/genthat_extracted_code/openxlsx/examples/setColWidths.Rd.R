library(openxlsx)


### Name: setColWidths
### Title: Set worksheet column widths
### Aliases: setColWidths

### ** Examples

## Create a new workbook
wb <- createWorkbook()

## Add a worksheet
addWorksheet(wb, "Sheet 1") 


## set col widths
setColWidths(wb, 1, cols = c(1,4,6,7,9), widths = c(16,15,12,18,33))

## auto columns
addWorksheet(wb, "Sheet 2")
writeData(wb, sheet = 2, x = iris)
setColWidths(wb, sheet = 2, cols = 1:5, widths = "auto")
  
## Save workbook
saveWorkbook(wb, "setColWidthsExample.xlsx", overwrite = TRUE)



