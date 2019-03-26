library(XLConnect)


### Name: readWorksheetFromFile
### Title: Reading data from worksheets in an Excel file (wrapper function)
### Aliases: readWorksheetFromFile
### Keywords: IO

### ** Examples

# multiregion xlsx file from demoFiles subfolder of 
# package XLConnect
demoExcelFile <- system.file("demoFiles/multiregion.xlsx", 
                             package = "XLConnect")

# Read single area from first sheet of existing file,
# "B2:C3" in Excel speak
df.one <- readWorksheetFromFile(demoExcelFile, sheet = 1, 
                                header = FALSE, startCol = 2, 
                                startRow = 2, endCol = 3, 
                                endRow = 3)

# Read three data sets in one from known positions
dflist <- readWorksheetFromFile(demoExcelFile,
                                sheet = c("FirstSheet", 
                                          "FirstSheet", 
                                          "SecondSheet"),
                                header = TRUE, 
                                startRow = c(2,2,3), 
                                startCol = c(2,5,2),
                                endCol = c(5,8,6), 
                                endRow = c(9,15,153))



