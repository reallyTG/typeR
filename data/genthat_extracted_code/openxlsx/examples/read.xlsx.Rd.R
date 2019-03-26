library(openxlsx)


### Name: read.xlsx
### Title: Read from an Excel file or Workbook object
### Aliases: read.xlsx

### ** Examples

xlsxFile <- system.file("readTest.xlsx", package = "openxlsx")
df1 <- read.xlsx(xlsxFile = xlsxFile, sheet = 1, skipEmptyRows = FALSE)
sapply(df1, class)

df2 <- read.xlsx(xlsxFile = xlsxFile, sheet = 3, skipEmptyRows = TRUE)
df2$Date <- convertToDate(df2$Date)
sapply(df2, class)
head(df2)

df2 <- read.xlsx(xlsxFile = xlsxFile, sheet = 3, skipEmptyRows = TRUE,
                   detectDates = TRUE)
sapply(df2, class)
head(df2)

wb <- loadWorkbook(system.file("readTest.xlsx", package = "openxlsx"))
df3 <- read.xlsx(wb, sheet = 2, skipEmptyRows = FALSE, colNames = TRUE)
df4 <- read.xlsx(xlsxFile, sheet = 2, skipEmptyRows = FALSE, colNames = TRUE)
all.equal(df3, df4)

wb <- loadWorkbook(system.file("readTest.xlsx", package = "openxlsx"))
df3 <- read.xlsx(wb, sheet = 2, skipEmptyRows = FALSE,
 cols = c(1, 4), rows = c(1, 3, 4))

## URL
## 
#xlsxFile <- "https://github.com/awalker89/openxlsx/raw/master/inst/readTest.xlsx"
#head(read.xlsx(xlsxFile))





