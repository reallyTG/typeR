library(Rpdb)


### Name: xyz2abc
### Title: From Cartesian to Fractional Coordinates and Vis Versa
### Aliases: abc2xyz abc2xyz.atoms abc2xyz.coords abc2xyz.distances
###   abc2xyz.pdb xyz2abc xyz2abc.atoms xyz2abc.coords xyz2abc.distances
###   xyz2abc.pdb
### Keywords: manip

### ** Examples

x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
basis(x)
x <- xyz2abc(x)
basis(x)
x <- abc2xyz(x)
basis(x)

## Not run: 
##D   
##D   # This example return an error because the coordinates stored
##D   # into the PDB file are already Cartesian coordinates.
##D   x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
##D   x <- abc2xyz(x)
## End(Not run)




