library(openxlsx)


### Name: write.xlsx
### Title: write data to an xlsx file
### Aliases: write.xlsx

### ** Examples


## write to working directory
options("openxlsx.borderColour" = "#4F80BD") ## set default border colour
write.xlsx(iris, file = "writeXLSX1.xlsx", colNames = TRUE, borders = "columns")
write.xlsx(iris, file = "writeXLSX2.xlsx", colNames = TRUE, borders = "surrounding")


hs <- createStyle(textDecoration = "BOLD", fontColour = "#FFFFFF", fontSize=12,
                  fontName="Arial Narrow", fgFill = "#4F80BD")

write.xlsx(iris, file = "writeXLSX3.xlsx", colNames = TRUE, borders = "rows", headerStyle = hs)

## Lists elements are written to individual worksheets, using list names as sheet names if available
l <- list("IRIS" = iris, "MTCATS" = mtcars, matrix(runif(1000), ncol = 5))
write.xlsx(l, "writeList1.xlsx", colWidths = c(NA, "auto", "auto"))

## different sheets can be given different parameters
write.xlsx(l, "writeList2.xlsx", startCol = c(1,2,3), startRow = 2,
           asTable = c(TRUE, TRUE, FALSE), withFilter = c(TRUE, FALSE, FALSE))




