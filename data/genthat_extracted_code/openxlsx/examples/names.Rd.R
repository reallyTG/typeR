library(openxlsx)


### Name: names
### Title: get or set worksheet names
### Aliases: names names.Workbook names<-.Workbook

### ** Examples


wb <- createWorkbook()
addWorksheet(wb, "S1")
addWorksheet(wb, "S2")
addWorksheet(wb, "S3")

names(wb)
names(wb)[[2]] <- "S2a"
names(wb)
names(wb) <- paste("Sheet", 1:3)



