library(openxlsx)


### Name: pageBreak
### Title: add a page break to a worksheet
### Aliases: pageBreak

### ** Examples

wb <- createWorkbook()
addWorksheet(wb, "Sheet 1")
writeData(wb, sheet = 1, x = iris)

pageBreak(wb, sheet = 1, i = 10, type = "row")
pageBreak(wb, sheet = 1, i = 20, type = "row")
pageBreak(wb, sheet = 1, i = 2, type = "column")

saveWorkbook(wb, "pageBreakExample.xlsx", TRUE)
## In Excel: View tab -> Page Break Preview



