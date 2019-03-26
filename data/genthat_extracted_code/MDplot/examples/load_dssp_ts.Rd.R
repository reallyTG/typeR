library(MDplot)


### Name: load_dssp_ts
### Title: Load DSSP timeseries
### Aliases: load_dssp_ts
### Keywords: DSSP

### ** Examples

# GROMOS
load_dssp_ts( system.file( "extdata/dssp_ts_example", package = "MDplot" ) )

# GROMACS
load_dssp_ts( folder = system.file( "extdata", package = "MDplot" ),
              filenames = "dssp_example_GROMACS.txt.gz",
              mdEngine = "GROMACS" )

# AMBER
load_dssp_ts( folder = system.file( "extdata", package = "MDplot" ),
              filenames = "dssp_ts_example_AMBER.txt.gz",
              mdEngine = "AMBER" )



