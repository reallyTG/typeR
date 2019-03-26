library(openxlsx)


### Name: writeFormula
### Title: Write a character vector as an Excel Formula
### Aliases: writeFormula

### ** Examples


## There are 3 ways to write a formula

wb <- createWorkbook()
addWorksheet(wb, "Sheet 1")
writeData(wb, "Sheet 1", x = iris)

## SEE int2col() to convert int to Excel column label

## 1. -  As a character vector using writeFormula

v <- c("SUM(A2:A151)", "AVERAGE(B2:B151)") ## skip header row
writeFormula(wb, sheet = 1, x = v, startCol = 10, startRow = 2)
writeFormula(wb, 1, x = "A2 + B2", startCol = 10, startRow = 10)


## 2. - As a data.frame column with class "formula" using writeData

df <- data.frame(x=1:3,
                 y = 1:3,
                 z = paste(paste0("A", 1:3+1L), paste0("B", 1:3+1L), sep = " + "),
                 z2 = sprintf("ADDRESS(1,%s)", 1:3),
                 stringsAsFactors = FALSE)

class(df$z) <- c(class(df$z), "formula")
class(df$z2) <- c(class(df$z2), "formula")

addWorksheet(wb, "Sheet 2")
writeData(wb, sheet = 2, x = df)



## 3. - As a vector with class "formula" using writeData

v2 <- c("SUM(A2:A4)", "AVERAGE(B2:B4)", "MEDIAN(C2:C4)")
class(v2) <- c(class(v2), "formula")

writeData(wb, sheet = 2, x = v2, startCol = 10, startRow = 2)

## Save workbook
saveWorkbook(wb, "writeFormulaExample.xlsx", overwrite = TRUE)


## Writing internal hyperlinks
wb <- createWorkbook()
addWorksheet(wb, "Sheet1")
addWorksheet(wb, "Sheet2")
writeFormula(wb, "Sheet1", x = '=HYPERLINK("#Sheet2!B3", "Text to Display - Link to Sheet2")')
saveWorkbook(wb, "writeFormulaHyperlinkExample.xlsx", overwrite = TRUE)




