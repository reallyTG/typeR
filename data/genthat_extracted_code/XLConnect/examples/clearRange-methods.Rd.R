library(XLConnect)


### Name: clearRange-methods
### Title: Clearing cell ranges in a workbook
### Aliases: clearRange clearRange-methods
###   clearRange,workbook,numeric-method
###   clearRange,workbook,character-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of 
# package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", 
                             package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Clear range from top left corner (4,2) ^= B4 to
# bottom right corner (6,4) ^= D6
clearRange(wb, sheet = "mtcars", coords = c(4, 2, 6, 4))

# Clear two ranges in one go ...
mat = matrix(c(5, 1, 6, 4, 5, 7, 7, 9), ncol = 4,
             byrow = TRUE)
clearRange(wb, sheet = "mtcars", coords = mat)

# The above is equivalent to ...
clearRange(wb, sheet = "mtcars",
           coords = aref2idx(c("A5:D6", "G5:I7")))
           
# This in turn is the same as ...
clearRangeFromReference(wb, reference = c("mtcars!A5:D6",
                        "mtcars!G5:I7"))



