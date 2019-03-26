library(XLConnect)


### Name: clearNamedRegion-methods
### Title: Clearing named regions in a workbook
### Aliases: clearNamedRegion clearNamedRegion-methods
###   clearNamedRegion,workbook,character-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of 
# package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", 
                             package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Read named region 'mtcars'
data <- readNamedRegion(wb, name = "mtcars", header = TRUE)

# Only consider cars with a weight >= 5
data <- data[data$wt >= 5, ]

# Clear original named region
clearNamedRegion(wb, name = "mtcars")

# Write subsetted data back
# Note: this is covering a smaller area now -
# writeNamedRegion automatically redefines the named region
# to the size/area of the data
writeNamedRegion(wb, data = data, name = "mtcars",
                 header = TRUE) 



