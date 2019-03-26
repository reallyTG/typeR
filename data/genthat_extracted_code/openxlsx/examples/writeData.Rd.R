library(openxlsx)


### Name: writeData
### Title: Write an object to a worksheet
### Aliases: writeData

### ** Examples


## See formatting vignette for further examples. 

## Options for default styling (These are the defaults)
options("openxlsx.borderColour" = "black")
options("openxlsx.borderStyle" = "thin")
options("openxlsx.dateFormat" = "mm/dd/yyyy")
options("openxlsx.datetimeFormat" = "yyyy-mm-dd hh:mm:ss")
options("openxlsx.numFmt" = NULL)

## Change the default border colour to #4F81BD
options("openxlsx.borderColour" = "#4F81BD")


#####################################################################################
## Create Workbook object and add worksheets
wb <- createWorkbook()

## Add worksheets
addWorksheet(wb, "Cars")
addWorksheet(wb, "Formula")


x <- mtcars[1:6,]
writeData(wb, "Cars", x, startCol = 2, startRow = 3, rowNames = TRUE)

#####################################################################################
## Bordering

writeData(wb, "Cars", x, rowNames = TRUE, startCol = "O", startRow = 3, 
         borders="surrounding", borderColour = "black") ## black border

writeData(wb, "Cars", x, rowNames = TRUE, 
         startCol = 2, startRow = 12, borders="columns")

writeData(wb, "Cars", x, rowNames = TRUE, 
         startCol="O", startRow = 12, borders="rows")


#####################################################################################
## Header Styles

hs1 <- createStyle(fgFill = "#DCE6F1", halign = "CENTER", textDecoration = "italic",
                   border = "Bottom")

writeData(wb, "Cars", x, colNames = TRUE, rowNames = TRUE, startCol="B",
     startRow = 23, borders="rows", headerStyle = hs1, borderStyle = "dashed")


hs2 <- createStyle(fontColour = "#ffffff", fgFill = "#4F80BD",
                   halign = "center", valign = "center", textDecoration = "bold",
                   border = "TopBottomLeftRight")

writeData(wb, "Cars", x, colNames = TRUE, rowNames = TRUE,
          startCol="O", startRow = 23, borders="columns", headerStyle = hs2)




##################################################################################### 
## Hyperlinks
## - vectors/columns with class 'hyperlink' are written as hyperlinks'

v <- rep("https://CRAN.R-project.org/", 4)
names(v) <- paste("Hyperlink", 1:4) # Optional: names will be used as display text
class(v) <- 'hyperlink'
writeData(wb, "Cars", x = v, xy = c("B", 32))


##################################################################################### 
## Formulas
## - vectors/columns with class 'formula' are written as formulas'

df <- data.frame(x=1:3, y = 1:3,
                 z = paste(paste0("A", 1:3+1L), paste0("B", 1:3+1L), sep = " + "),
                 stringsAsFactors = FALSE)

class(df$z) <- c(class(df$z), "formula")

writeData(wb, sheet = "Formula", x = df)


##################################################################################### 
## Save workbook
## Open in excel without saving file: openXL(wb)

saveWorkbook(wb, "writeDataExample.xlsx", overwrite = TRUE)



