library(OpenRepGrid)


### Name: importTxtInternal
### Title: ImportTxtInternal is the parser for importTxt.
### Aliases: importTxtInternal
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D # supposing that the data file sample.txt is in the current directory
##D file <- "sample.txt"
##D imp <- importTxtInternal(file)
##D 
##D # specifying a directory (arbitrary example directory)
##D dir <- "/Users/markheckmann/data"
##D imp <- importTxtInternal(file, dir)
##D 
##D # using a full path
##D imp <- importTxtInternal("/Users/markheckmann/data/sample.txt")
##D 
##D # load Gridsuite data from URL
##D imp <- importTxtInternal("http://www.openrepgrid.uni-bremen.de/data/sample.txt")
## End(Not run)




