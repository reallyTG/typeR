library(MDplot)


### Name: hbond_ts
### Title: Plot hydrogen bond timeseries
### Aliases: hbond_ts
### Keywords: hbond hydrogen bond timeseries

### ** Examples

# the examples are valid and wrapped in the "dontrun{}" environment for efficiency purposes only
# GROMOS
## Not run: 
##D hbond_ts( load_hbond_ts( system.file( "extdata/hbond_ts_example.txt.gz",
##D                                       package = "MDplot" ) ),
##D           load_hbond( system.file( "extdata/hbond_example.txt.gz",
##D                                    package = "MDplot" ) ) )
## End(Not run)

# GROMACS
## Not run: 
##D hbond_ts( load_hbond_ts( system.file( "extdata/hbond_ts_example_GROMACS.xpm.gz",
##D                                       package = "MDplot" ),
##D                          mdEngine = "GROMACS" ),
##D           load_hbond( system.file( "extdata/hbond_ts_example_GROMACS.xpm.gz",
##D                                   package = "MDplot" ),
##D                       system.file( "extdata/hbond_example_GROMACS.txt.gz",
##D                                    package = "MDplot" ),
##D                       mdEngine = "GROMACS" ),
##D           plotOccurences = TRUE, namesToSingle = FALSE, printNames = TRUE,
##D           printAtoms = TRUE, hbondIndices = list( c( 1, 12 ) ),
##D           timeUnit = "ns", snapshotsPerTimeInt = 100 )
## End(Not run)

# AMBER
hbond_ts( load_hbond_ts( system.file( "extdata/hbond_ts_example_AMBER.txt.gz",
                                      package = "MDplot" ),
                         mdEngine = "AMBER" ),
          load_hbond( system.file( "extdata/hbond_ts_example_AMBER.txt.gz",
                                   package = "MDplot" ),
                         mdEngine = "AMBER" ),
          plotOccurences = TRUE, timeRange = c( 20, 60 ) )



