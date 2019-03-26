library(XLConnect)


### Name: clearRangeFromReference-methods
### Title: Clearing cell ranges in a workbook
### Aliases: clearRangeFromReference clearRangeFromReference-methods
###   clearRangeFromReference,workbook,character-method
### Keywords: methods utilities

### ** Examples

# mtcars xlsx file from demoFiles subfolder of 
# package XLConnect
demoExcelFile <- system.file("demoFiles/mtcars.xlsx", 
                             package = "XLConnect")

# Load workbook
wb <- loadWorkbook(demoExcelFile)

# Clear ranges A5:D6 and G5:I7 on sheet mtcars
clearRangeFromReference(wb, reference = c("mtcars!A5:D6",
                        "mtcars!G5:I7"))



