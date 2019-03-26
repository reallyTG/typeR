library(openxlsx)


### Name: insertImage
### Title: Insert an image into a worksheet
### Aliases: insertImage

### ** Examples

## Create a new workbook
wb <- createWorkbook("Ayanami")

## Add some worksheets
addWorksheet(wb, "Sheet 1")
addWorksheet(wb, "Sheet 2")
addWorksheet(wb, "Sheet 3")

## Insert images
img <- system.file("einstein.jpg", package = "openxlsx")
insertImage(wb, "Sheet 1", img, startRow = 5,  startCol = 3, width = 6, height = 5)
insertImage(wb, 2, img, startRow = 2,  startCol = 2)
insertImage(wb, 3 , img, width = 15, height = 12, startRow = 3, startCol = "G", units = "cm")
 
## Save workbook
saveWorkbook(wb, "insertImageExample.xlsx", overwrite = TRUE)



