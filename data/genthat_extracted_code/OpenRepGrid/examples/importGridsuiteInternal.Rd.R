library(OpenRepGrid)


### Name: importGridsuiteInternal
### Title: Internal parser for Gridsuite data files
### Aliases: importGridsuiteInternal
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D # supposing that the data file gridsuite.xml is in the current directory
##D file <- "gridsuite.xml"
##D imp <- importGridsuite(file)
##D 
##D # specifying a directory (arbitrary example directory)
##D dir <- "/Users/markheckmann/data"
##D imp <- importGridsuite(file, dir)
##D 
##D # using a full path
##D imp <- importGridsuite("/Users/markheckmann/data/gridsuite.xml")
##D 
##D # load Gridsuite data from URL
##D imp <- importGridsuite("http://www.openrepgrid.uni-bremen.de/data/gridsuite.xml")
## End(Not run)





