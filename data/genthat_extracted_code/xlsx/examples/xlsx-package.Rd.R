library(xlsx)


### Name: xlsx-package
### Title: Read, write, format Excel 2007 and Excel 97/2000/XP/2003 files
### Aliases: xlsx-package xlsx
### Keywords: package

### ** Examples

## Not run: 
##D 
##D require(xlsx)
##D 
##D # example of reading xlsx sheets
##D file <- system.file("tests", "test_import.xlsx", package = "xlsx")
##D res <- read.xlsx(file, 2)  # read the second sheet
##D 
##D # example of writing xlsx sheets
##D file <- paste(tempfile(), "xlsx", sep=".")
##D write.xlsx(USArrests, file=file)
##D 
## End(Not run)



