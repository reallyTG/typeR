library(openxlsx)


### Name: renameWorksheet
### Title: Rename a worksheet
### Aliases: renameWorksheet

### ** Examples


## Create a new workbook
wb <- createWorkbook("CREATOR")

## Add 3 worksheets
addWorksheet(wb, "Worksheet Name")
addWorksheet(wb, "This is worksheet 2")
addWorksheet(wb, "Not the best name")

#' ## rename all worksheets
names(wb) <- c("A", "B", "C")


## Rename worksheet 1 & 3
renameWorksheet(wb, 1, "New name for sheet 1")
names(wb)[[1]] <- "New name for sheet 1"
names(wb)[[3]] <-  "A better name"

## Save workbook
saveWorkbook(wb, "renameWorksheetExample.xlsx", overwrite = TRUE)



