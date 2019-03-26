library(xlsx)


### Name: Picture
### Title: Functions to manipulate images in a spreadsheet.
### Aliases: Picture addPicture

### ** Examples


file <- system.file("tests", "log_plot.jpeg", package = "xlsx")

wb <- createWorkbook()  
sheet <- createSheet(wb, "Sheet1")

addPicture(file, sheet)

# don't forget to save the workbook!




