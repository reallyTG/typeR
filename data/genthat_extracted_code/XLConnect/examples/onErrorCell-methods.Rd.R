library(XLConnect)


### Name: onErrorCell-methods
### Title: Behavior when error cells are detected
### Aliases: onErrorCell onErrorCell-methods onErrorCell,workbook-method
### Keywords: utilities error

### ** Examples

# errorCell xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/errorCell.xlsx", 
							  package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Set error behavior to XLC$ERROR.WARN when detecting error cells
# Note: this is the default behavior
onErrorCell(wb, XLC$ERROR.WARN)
# Alternatively: wb$onErrorCell(XLC$ERROR.WARN)

# Read named region 'MyData' (with default header = TRUE)
data <- readNamedRegion(wb, name = "MyData")

# Now set error behavior to XLC$ERROR.STOP to immediately
# issue an exception and stop in case an error cell is
# detected
onErrorCell(wb, XLC$ERROR.STOP)
# Alternatively: wb$onErrorCell(XLC$ERROR.STOP)

# Read (again) named region 'MyData' (with default header = TRUE)
res <- try(readNamedRegion(wb, name = "MyData"))
# Did we get an error?
print(is(res, "try-error"))



