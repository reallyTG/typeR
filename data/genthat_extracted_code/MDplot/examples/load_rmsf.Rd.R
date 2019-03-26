library(MDplot)


### Name: load_rmsf
### Title: Loading function for 'rmsf()'
### Aliases: load_rmsf
### Keywords: rmsf

### ** Examples

# GROMOS
load_rmsf( c( system.file( "extdata/rmsf_example_1.txt.gz", package = "MDplot" ),
              system.file( "extdata/rmsf_example_2.txt.gz", package = "MDplot" ) ) )

# GROMACS
load_rmsf( c( system.file( "extdata/rmsf_example_GROMACS.txt.gz",
                           package = "MDplot" ) ),
          mdEngine = "GROMACS" )

# AMBER
load_rmsf( c( system.file( "extdata/rmsf_example_AMBER.txt.gz",
                           package = "MDplot" ) ),
          mdEngine = "AMBER" )



