library(MDplot)


### Name: load_timeseries
### Title: Loading function for 'timeseries()'
### Aliases: load_timeseries
### Keywords: timeseries

### ** Examples

# GROMOS
load_timeseries( c( system.file( "extdata/timeseries_example_1.txt.gz",
                                 package = "MDplot" ),
                    system.file( "extdata/timeseries_example_2.txt.gz",
                                 package = "MDplot" ) ) )

# GROMACS
load_timeseries( c( system.file( "extdata/timeseries_example_GROMACS.txt.gz",
                                 package = "MDplot" ) ),
                 mdEngine = "GROMACS" )



