library(openxlsx)


### Name: getStyles
### Title: Returns a list of all styles in the workbook
### Aliases: getStyles

### ** Examples

## load a workbook 
wb <- loadWorkbook(file = system.file("loadExample.xlsx", package = "openxlsx"))
getStyles(wb)[1:3]



