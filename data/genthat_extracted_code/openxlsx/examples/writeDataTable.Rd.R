library(openxlsx)


### Name: writeDataTable
### Title: Write to a worksheet as an Excel table
### Aliases: writeDataTable

### ** Examples

## see package vignettes for further examples.

#####################################################################################
## Create Workbook object and add worksheets
wb <- createWorkbook()
addWorksheet(wb, "S1")
addWorksheet(wb, "S2")
addWorksheet(wb, "S3")


#####################################################################################
## -- write data.frame as an Excel table with column filters
## -- default table style is "TableStyleMedium2"

writeDataTable(wb, "S1", x = iris)

writeDataTable(wb, "S2", x = mtcars, xy = c("B", 3), rowNames = TRUE,
  tableStyle = "TableStyleLight9")

df <- data.frame("Date" = Sys.Date()-0:19,
                 "T" = TRUE, "F" = FALSE,
                 "Time" = Sys.time()-0:19*60*60,
                 "Cash" = paste("$",1:20), "Cash2" = 31:50,
                 "hLink" = "https://CRAN.R-project.org/", 
                 "Percentage" = seq(0, 1, length.out=20),
                 "TinyNumbers" = runif(20) / 1E9,  stringsAsFactors = FALSE)

## openxlsx will apply default Excel styling for these classes
class(df$Cash) <- c(class(df$Cash), "currency")
class(df$Cash2) <- c(class(df$Cash2), "accounting")
class(df$hLink) <- "hyperlink"
class(df$Percentage) <- c(class(df$Percentage), "percentage")
class(df$TinyNumbers) <- c(class(df$TinyNumbers), "scientific")

writeDataTable(wb, "S3", x = df, startRow = 4, rowNames = TRUE, tableStyle = "TableStyleMedium9")

#####################################################################################
## Additional Header Styling and remove column filters

writeDataTable(wb, sheet = 1, x = iris, startCol = 7, headerStyle = createStyle(textRotation = 45),
                 withFilter = FALSE)


##################################################################################### 
## Save workbook
## Open in excel without saving file: openXL(wb)

saveWorkbook(wb, "writeDataTableExample.xlsx", overwrite = TRUE)





##################################################################################### 
## Pre-defined table styles gallery

wb <- createWorkbook(paste0("tableStylesGallery.xlsx"))
addWorksheet(wb, "Style Samples")
for(i in 1:21) {
  style <- paste0("TableStyleLight", i)
  writeDataTable(wb, x=data.frame(style), sheet=1, tableStyle=style, startRow = 1, startCol = i*3-2)
}

for(i in 1:28) {
  style <- paste0("TableStyleMedium", i)
  writeDataTable(wb, x=data.frame(style), sheet=1, tableStyle=style, startRow = 4, startCol = i*3-2)
}

for(i in 1:11) {
  style <- paste0("TableStyleDark", i)
  writeDataTable(wb, x=data.frame(style), sheet=1, tableStyle=style, startRow = 7, startCol = i*3-2)
} 

## openXL(wb)
saveWorkbook(wb, file = "tableStylesGallery.xlsx", overwrite = TRUE)




