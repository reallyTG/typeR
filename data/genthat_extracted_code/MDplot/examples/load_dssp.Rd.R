library(MDplot)


### Name: load_dssp
### Title: Load DSSP information
### Aliases: load_dssp
### Keywords: dssp

### ** Examples

# GROMOS
load_dssp( system.file( "extdata/dssp_example.txt.gz", package = "MDplot" ) )

# GROMACS
load_dssp( system.file( "extdata/dssp_example_GROMACS.txt.gz",
                        package = "MDplot" ), mdEngine = "GROMACS" )

# AMBER (same input as for load_dssp_ts())
load_dssp( system.file( "extdata/dssp_ts_example_AMBER.txt.gz",
                        package = "MDplot" ), mdEngine = "AMBER" )



