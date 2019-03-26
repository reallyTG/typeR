library(OpenRepGrid)


### Name: importGridstatInternal
### Title: Parser for Gridstat data files.
### Aliases: importGridstatInternal
### Keywords: internal

### ** Examples

## Not run: 
##D 
##D # supposing that the data file gridstat.dat is in the current working directory
##D file <- "gridstat.dat"
##D imp <- importGridstatInternal(file)
##D 
##D # specifying a directory (example)
##D dir <- "/Users/markheckmann/data"
##D imp <- importGridstatInternal(file, dir)
##D 
##D # using a full path (example)
##D imp <- importGridstatInternal("/Users/markheckmann/data/gridstat.dat")
##D 
##D # load gridstat data from URL
##D imp <- importGridstatInternal("http://www.openrepgrid.uni-bremen.de/data/gridstat.dat")
##D 
##D # setting rating scale range
##D imp <- importGridstatInternal(file, dir, min=1, max=6)
## End(Not run)




