library(openxlsx)


### Name: freezePane
### Title: Freeze a worksheet pane
### Aliases: freezePane

### ** Examples

## Create a new workbook
wb <- createWorkbook("Kenshin")

## Add some worksheets
addWorksheet(wb, "Sheet 1")
addWorksheet(wb, "Sheet 2")
addWorksheet(wb, "Sheet 3")
addWorksheet(wb, "Sheet 4")

## Freeze Panes
freezePane(wb, "Sheet 1" ,  firstActiveRow = 5,  firstActiveCol = 3)
freezePane(wb, "Sheet 2", firstCol = TRUE)  ## shortcut to firstActiveCol = 2
freezePane(wb, 3, firstRow = TRUE)  ## shortcut to firstActiveRow = 2
freezePane(wb, 4, firstActiveRow = 1, firstActiveCol = "D")
 
## Save workbook
saveWorkbook(wb, "freezePaneExample.xlsx", overwrite = TRUE)



