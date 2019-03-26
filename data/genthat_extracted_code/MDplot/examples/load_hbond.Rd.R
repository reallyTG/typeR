library(MDplot)


### Name: load_hbond
### Title: Loading hydrogen bond data
### Aliases: load_hbond
### Keywords: hbond

### ** Examples

# GROMOS
load_hbond( system.file( "extdata/hbond_example.txt.gz", package = "MDplot" ) )

# GROMACS
load_hbond( system.file( "extdata/hbond_ts_example_GROMACS.xpm.gz",
                         package = "MDplot" ),
            system.file( "extdata/hbond_example_GROMACS.txt.gz",
                         package = "MDplot" ),
            mdEngine = "GROMACS" )

# AMBER (summary)
load_hbond( system.file( "extdata/hbond_example_AMBER.txt.gz",
            package = "MDplot" ), mdEngine = "AMBER" )

# AMBER (time-series)
load_hbond( system.file( "extdata/hbond_ts_example_AMBER.txt.gz",
            package = "MDplot" ), mdEngine = "AMBER" )



