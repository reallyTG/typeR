library(XLConnect)


### Name: readNamedRegion
### Title: Reading named regions from a workbook
### Aliases: readNamedRegion readNamedRegion-methods
###   readNamedRegion,workbook-method
### Keywords: methods IO

### ** Examples

## Example 1:
# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read named region 'mtcars' (with default header = TRUE)
data <- readNamedRegion(wb, name = "mtcars")

## Example 2;
# conversion xlsx file from demoFiles subfolder of package XLConnect
excelFile <- system.file("demoFiles/conversion.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(excelFile)

# Read named region 'conversion' with pre-specified column types
# Note: in the worksheet all data was entered as strings!
# forceConversion = TRUE is used to force conversion from String
# into the less generic data types Numeric, DateTime & Boolean
df <- readNamedRegion(wb, name = "conversion", header = TRUE,
                      colTypes = c(XLC$DATA_TYPE.NUMERIC,
                                   XLC$DATA_TYPE.DATETIME,
                                   XLC$DATA_TYPE.BOOLEAN),
                      forceConversion = TRUE,
                      dateTimeFormat = "%Y-%m-%d %H:%M:%S")
                      
## Example 3:
# mtcars xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read the columns 1, 3 and 5 of the named region 'mtcars' (with default header = TRUE)
data <- readNamedRegion(wb, name = "mtcars", keep=c(1,3,5))



