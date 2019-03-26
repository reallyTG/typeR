library(openxlsx)


### Name: setRowHeights
### Title: Set worksheet row heights
### Aliases: setRowHeights

### ** Examples

## Create a new workbook
wb <- createWorkbook()

## Add a worksheet
addWorksheet(wb, "Sheet 1") 

## set row heights
setRowHeights(wb, 1, rows = c(1,4,22,2,19), heights = c(24,28,32,42,33))

## overwrite row 1 height
setRowHeights(wb, 1, rows = 1, heights = 40)

## Save workbook
saveWorkbook(wb, "setRowHeightsExample.xlsx", overwrite = TRUE)



