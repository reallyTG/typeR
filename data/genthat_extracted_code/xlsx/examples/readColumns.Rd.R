library(xlsx)


### Name: readColumns
### Title: Read a contiguous set of columns from sheet into an R data.frame
### Aliases: readColumns

### ** Examples

## Not run: 
##D 
##D   file <- system.file("tests", "test_import.xlsx", package = "xlsx")
##D 
##D   wb     <- loadWorkbook(file)
##D   sheets <- getSheets(wb)
##D 
##D   sheet <- sheets[["all"]]
##D   res <- readColumns(sheet, startColumn=3, endColumn=10, startRow=3,
##D     endRow=7)
##D 
##D   sheet <- sheets[["NAs"]]
##D   res <- readColumns(sheet, 1, 6, 1,  colClasses=c("Date", "character",
##D     "integer", rep("numeric", 2),  "POSIXct"))
##D  
##D 
## End(Not run)



