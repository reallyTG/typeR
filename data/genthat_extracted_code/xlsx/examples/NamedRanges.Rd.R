library(xlsx)


### Name: NamedRanges
### Title: Functions to manipulate named ranges.
### Aliases: NamedRanges Range getRanges readRange createRange

### ** Examples

## Not run: 
##D file <- system.file("tests", "test_import.xlsx", package = "xlsx")
##D wb <- loadWorkbook(file)
##D sheet <- getSheets(wb)[["deletedFields"]]  
##D ranges <- getRanges(wb)
##D 
##D ranges[[1]]$getNameName()  # get its name
##D 
##D # see all the available java methods that you can call
##D .jmethods(ranges[[1]])
##D 
##D # create a new named range
##D firstCell <- sheet$getRow(14L)$getCell(4L)
##D lastCell  <- sheet$getRow(20L)$getCell(7L)
##D rangeName <- "Test2"
##D createRange(rangeName, firstCell, lastCell)
## End(Not run)



