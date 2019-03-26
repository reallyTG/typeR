library(XLConnect)


### Name: readWorksheet-methods
### Title: Reading data from worksheets
### Aliases: readWorksheet readWorksheet-methods
###   readWorksheet,workbook,character-method
###   readWorksheet,workbook,numeric-method
### Keywords: methods IO

### ** Examples

## Example 1:
# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read worksheet 'mtcars' (providing no specific area bounds;
# with default header = TRUE)
data <- readWorksheet(wb, sheet = "mtcars")


## Example 2:
# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read worksheet 'mtcars' (providing area bounds; with default header = TRUE)
data <- readWorksheet(wb, sheet = "mtcars", startRow = 1, startCol = 3,
                      endRow = 15, endCol = 8)


## Example 3:
# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read worksheet 'mtcars' (providing area bounds using the region argument;
# with default header = TRUE)
data <- readWorksheet(wb, sheet = "mtcars", region = "C1:H15")


## Example 4:
# conversion xlsx file from demoFiles subfolder of package XLConnect
excelFile <- system.file("demoFiles/conversion.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(excelFile)

# Read worksheet 'Conversion' with pre-specified column types
# Note: in the worksheet all data was entered as strings!
# forceConversion = TRUE is used to force conversion from String
# into the less generic data types Numeric, DateTime & Boolean
df <- readWorksheet(wb, sheet = "Conversion", header = TRUE,
                    colTypes = c(XLC$DATA_TYPE.NUMERIC,
                                 XLC$DATA_TYPE.DATETIME,
                                 XLC$DATA_TYPE.BOOLEAN),
                    forceConversion = TRUE,
                    dateTimeFormat = "%Y-%m-%d %H:%M:%S")
                    
## Example 5:
# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read the columns 1, 3 and 5 from the sheet 'mtcars' (with default header = TRUE)
data <- readWorksheet(wb, sheet = "mtcars", keep=c(1,3,5))



