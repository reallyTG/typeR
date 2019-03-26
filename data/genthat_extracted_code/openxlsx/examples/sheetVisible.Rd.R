library(openxlsx)


### Name: sheetVisible
### Title: Get worksheet visible state.
### Aliases: sheetVisible sheetVisible<-

### ** Examples


wb <- createWorkbook()
addWorksheet(wb, sheetName = "S1", visible = FALSE)
addWorksheet(wb, sheetName = "S2", visible = TRUE)
addWorksheet(wb, sheetName = "S3", visible = FALSE)

sheetVisible(wb)
sheetVisible(wb)[1] <- TRUE ## show sheet 1
sheetVisible(wb)[2] <- FALSE ## hide sheet 2




