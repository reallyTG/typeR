library(MDplot)


### Name: load_rmsd
### Title: Loading function for 'rmsd()'
### Aliases: load_rmsd
### Keywords: rmsd

### ** Examples

# GROMOS
load_rmsd( c( system.file( "extdata/rmsd_example_1.txt.gz", package = "MDplot" ),
              system.file( "extdata/rmsd_example_2.txt.gz", package = "MDplot" ) ) )

# GROMACS
load_rmsd( c( system.file( "extdata/rmsd_example_GROMACS.txt.gz",
                           package = "MDplot" ) ),
           mdEngine = "GROMACS" )

# AMBER
load_rmsd( c( system.file( "extdata/rmsd_example_AMBER.txt.gz",
                           package = "MDplot" ) ),
           mdEngine = "AMBER" )



