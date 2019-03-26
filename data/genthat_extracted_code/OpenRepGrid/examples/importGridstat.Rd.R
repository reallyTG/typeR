library(OpenRepGrid)


### Name: importGridstat
### Title: Import Gridstat data files.
### Aliases: importGridstat

### ** Examples

## Not run: 
##D 
##D # using the pop-up selection menu
##D rg <- importGridstat()
##D 
##D # supposing that the data file gridstat.dat is in the current working directory
##D file <- "gridstat.dat"
##D rg <- importGridstat(file)
##D 
##D # specifying a directory (example)
##D dir <- "/Users/markheckmann/data"
##D rg <- importGridstat(file, dir)
##D 
##D # using a full path (example)
##D rg <- importGridstat("/Users/markheckmann/data/gridstat.dat")
##D 
##D # load gridstat data from URL
##D rg <- importGridstat("http://www.openrepgrid.uni-bremen.de/data/gridstat.dat")
##D 
##D # setting rating scale range
##D rg <- importGridstat(file, dir, min=1, max=6)
## End(Not run)




