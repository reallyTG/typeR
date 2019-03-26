library(openxlsx)


### Name: replaceStyle
### Title: Replace an existing cell style
### Aliases: replaceStyle

### ** Examples


## load a workbook 
wb <- loadWorkbook(file = system.file("loadExample.xlsx", package = "openxlsx"))

## create a new style and replace style 2

newStyle <- createStyle(fgFill = "#00FF00")
 
## replace style 2
getStyles(wb)[1:3] ## prints styles
replaceStyle(wb, 2, newStyle = newStyle)

## Save workbook
saveWorkbook(wb, "replaceStyleExample.xlsx", overwrite = TRUE)



