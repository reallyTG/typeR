library(MDplot)


### Name: timeseries
### Title: General timeseries plotting function
### Aliases: timeseries
### Keywords: timeseries

### ** Examples

# GROMOS
timeseries( load_timeseries( c( system.file( "extdata/timeseries_example_1.txt.gz",
                                             package = "MDplot" ),
                                system.file( "extdata/timeseries_example_2.txt.gz",
                                             package = "MDplot" ) ) ),
            snapshotsPerTimeInt = 100 )

# GROMACS
timeseries( load_timeseries( c( system.file( "extdata/timeseries_example_GROMACS.txt.gz",
                                             package = "MDplot" ) ),
                             mdEngine = "GROMACS" ),
            ylim = c( 0.545, 0.7 ), valueName = "Area per lipid", valueUnit = "nm^2" )



