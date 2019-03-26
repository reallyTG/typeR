library(OpenRepGrid)


### Name: importScivescoInternal
### Title: Internal parser for sci:vesco files (suffix 'scires').
### Aliases: importScivescoInternal
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D # supposing that the data file scivesco.scires is in the current directory
##D file <- "scivesco.scires"
##D imp <- importScivescoInternal(file)
##D 
##D # specifying a directory (arbitrary example directory)
##D dir <- "/Users/markheckmann/data"
##D imp <- importScivescoInternal(file, dir)
##D 
##D # using a full path
##D imp <- importScivescoInternal("/Users/markheckmann/data/scivesco.scires")
##D 
##D # load Sci:Vesco data from URL
##D imp <- importScivescoInternal("http://www.openrepgrid.uni-bremen.de/data/scivesco.scires")
## End(Not run)





