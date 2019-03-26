library(openxlsx)


### Name: copyWorkbook
### Title: Copy a Workbook object.
### Aliases: copyWorkbook

### ** Examples


wb <- createWorkbook()  
wb2 <- wb ## does not create a copy
wb3 <- copyWorkbook(wb) ## wrapper for wb$copy()

addWorksheet(wb, "Sheet1") ## adds worksheet to both wb and wb2 but not wb3

names(wb)
names(wb2)
names(wb3)




