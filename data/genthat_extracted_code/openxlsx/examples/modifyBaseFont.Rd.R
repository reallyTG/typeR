library(openxlsx)


### Name: modifyBaseFont
### Title: Modify the default font
### Aliases: modifyBaseFont

### ** Examples

## create a workbook
wb <- createWorkbook()
addWorksheet(wb, "S1")
## modify base font to size 10 Arial Narrow in red
modifyBaseFont(wb, fontSize = 10, fontColour = "#FF0000", fontName = "Arial Narrow")

writeData(wb, "S1", iris)
writeDataTable(wb, "S1", x = iris, startCol = 10) ## font colour does not affect tables
saveWorkbook(wb, "modifyBaseFontExample.xlsx", overwrite = TRUE)



