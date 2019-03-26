library(openxlsx)


### Name: pageSetup
### Title: Set page margins, orientation and print scaling
### Aliases: pageSetup

### ** Examples

wb <- createWorkbook()
addWorksheet(wb, "S1")
addWorksheet(wb, "S2")
writeDataTable(wb, 1, x = iris[1:30,])
writeDataTable(wb, 2, x = iris[1:30,], xy = c("C", 5))

## landscape page scaled to 50%
pageSetup(wb, sheet = 1, orientation = "landscape", scale = 50)

## portrait page scales to 300% with 0.5in left and right margins
pageSetup(wb, sheet = 2, orientation = "portrait", scale = 300, left= 0.5, right = 0.5)


## print titles
addWorksheet(wb, "print_title_rows")
addWorksheet(wb, "print_title_cols")

writeData(wb, "print_title_rows", rbind(iris, iris, iris, iris))
writeData(wb, "print_title_cols", x = rbind(mtcars, mtcars, mtcars), rowNames = TRUE)

pageSetup(wb, sheet = "print_title_rows", printTitleRows = 1) ## first row
pageSetup(wb, sheet = "print_title_cols", printTitleCols = 1, printTitleRows = 1)


saveWorkbook(wb, "pageSetupExample.xlsx", overwrite = TRUE)



