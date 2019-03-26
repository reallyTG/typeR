library(openxlsx)


### Name: getBaseFont
### Title: Return the workbook default font
### Aliases: getBaseFont

### ** Examples

## create a workbook
wb <- createWorkbook()
getBaseFont(wb)

## modify base font to size 10 Arial Narrow in red
modifyBaseFont(wb, fontSize = 10, fontColour = "#FF0000", fontName = "Arial Narrow")

getBaseFont(wb)



