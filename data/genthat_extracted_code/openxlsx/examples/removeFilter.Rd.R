library(openxlsx)


### Name: removeFilter
### Title: Remove a worksheet filter
### Aliases: removeFilter

### ** Examples

wb <- createWorkbook()
addWorksheet(wb, "Sheet 1")
addWorksheet(wb, "Sheet 2")
addWorksheet(wb, "Sheet 3")

writeData(wb, 1, iris)
addFilter(wb, 1, row = 1, cols = 1:ncol(iris))

## Equivalently
writeData(wb, 2, x = iris, withFilter = TRUE)

## Similarly
writeDataTable(wb, 3, iris)

## remove filters
removeFilter(wb, 1:2) ## remove filters
removeFilter(wb, 3) ## Does not affect tables!

saveWorkbook(wb, file = "removeFilterExample.xlsx", overwrite = TRUE)



