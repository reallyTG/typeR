library(openxlsx)


### Name: showGridLines
### Title: Set worksheet gridlines to show or hide.
### Aliases: showGridLines

### ** Examples

wb <- loadWorkbook(file = system.file("loadExample.xlsx", package = "openxlsx"))
names(wb) ## list worksheets in workbook
showGridLines(wb, 1, showGridLines = FALSE)
showGridLines(wb, "testing", showGridLines = FALSE)
saveWorkbook(wb, "showGridLinesExample.xlsx", overwrite = TRUE)



