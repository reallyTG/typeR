library(openxlsx)


### Name: addStyle
### Title: Add a style to a set of cells
### Aliases: addStyle

### ** Examples

## See package vignette for more examples.

## Create a new workbook
wb <- createWorkbook("My name here")

## Add a worksheets
addWorksheet(wb, "Expenditure", gridLines = FALSE) 

##write data to worksheet 1
writeData(wb, sheet = 1, USPersonalExpenditure, rowNames = TRUE)

## create and add a style to the column headers
headerStyle <- createStyle(fontSize = 14, fontColour = "#FFFFFF", halign = "center",
                        fgFill = "#4F81BD", border="TopBottom", borderColour = "#4F81BD")

addStyle(wb, sheet = 1, headerStyle, rows = 1, cols = 1:6, gridExpand = TRUE)

## style for body 
bodyStyle <- createStyle(border="TopBottom", borderColour = "#4F81BD")
addStyle(wb, sheet = 1, bodyStyle, rows = 2:6, cols = 1:6, gridExpand = TRUE)
setColWidths(wb, 1, cols=1, widths = 21) ## set column width for row names column

saveWorkbook(wb, "addStyleExample.xlsx", overwrite = TRUE)



