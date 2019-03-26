library(openxlsx)


### Name: addFilter
### Title: Add column filters
### Aliases: addFilter

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

saveWorkbook(wb, file = "addFilterExample.xlsx", overwrite = TRUE)



