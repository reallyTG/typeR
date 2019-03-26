library(xlsx)


### Name: readRows
### Title: Read a contiguous set of rows into an R matrix
### Aliases: readRows

### ** Examples

## Not run: 
##D 
##D   file <- system.file("tests", "test_import.xlsx", package = "xlsx")
##D 
##D   wb     <- loadWorkbook(file)
##D   sheets <- getSheets(wb)
##D 
##D   sheet <- sheets[["all"]]
##D   res <- readRows(sheet, startRow=3, endRow=7, startColumn=3, endColumn=10)
##D 
##D  
##D 
## End(Not run)



