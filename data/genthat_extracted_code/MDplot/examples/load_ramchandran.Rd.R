library(MDplot)


### Name: load_ramachandran
### Title: Load dihedral information (Ramachandran plot input)
### Aliases: load_ramachandran
### Keywords: Ramachandran

### ** Examples

# GROMOS
load_ramachandran( system.file( "extdata/ramachandran_example.txt.gz", package = "MDplot" ) )

# GROMACS
load_ramachandran( system.file( "extdata/ramachandran_example_GROMACS.txt.gz",
                   package = "MDplot" ), mdEngine = "GROMACS" )

# AMBER
load_ramachandran( system.file( "extdata/ramachandran_example_AMBER.txt.gz",
                   package = "MDplot" ), mdEngine = "AMBER" )



