library(OpenRepGrid)


### Name: importGridcorInternal
### Title: Internal parser for GRIDCOR data files.
### Aliases: importGridcorInternal
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D # supposing that the data file gridcor.dat is in the current directory
##D file <- "gridcor.dat"
##D imp <- importGridcorInternal(file)
##D 
##D # specifying a directory (arbitrary example directory)
##D dir <- "/Users/markheckmann/data"
##D imp <- importGridcorInternal(file, dir)
##D 
##D # using a full path
##D imp <- importGridcorInternal("/Users/markheckmann/data/gridcor.dat")
##D 
##D # load GRIDCOR data from URL
##D imp <- importGridcorInternal("http://www.openrepgrid.uni-bremen.de/data/gridcor.dat")
## End(Not run)





