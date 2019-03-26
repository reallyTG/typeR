library(MDplot)


### Name: load_hbond_ts
### Title: Loading hydrogen bonds timeseries
### Aliases: load_hbond_ts
### Keywords: hbond

### ** Examples

# the examples are valid and wrapped in the "dontrun{}" environment for efficiency purposes only
# GROMOS
## Not run: 
##D load_hbond_ts( system.file( "extdata/hbond_ts_example.txt.gz", package = "MDplot" ) )
## End(Not run)

# GROMACS
## Not run: 
##D load_hbond_ts( system.file( "extdata/hbond_ts_example_GROMACS.xpm.gz",
##D                             package = "MDplot" ),
##D                mdEngine = "GROMACS" )
## End(Not run)

# AMBER
## Not run: 
##D load_hbond_ts( system.file( "extdata/hbond_ts_example_AMBER.txt.gz",
##D                             package = "MDplot" ),
##D                mdEngine = "AMBER" )
## End(Not run)



