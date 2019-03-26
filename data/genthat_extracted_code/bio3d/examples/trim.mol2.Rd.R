library(bio3d)


### Name: trim.mol2
### Title: Trim a MOL2 Object To A Subset of Atoms.
### Aliases: trim.mol2
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Read a MOL2 file from those included with the package
##D mol <- read.mol2( system.file("examples/aspirin.mol2", package="bio3d"))
##D 
##D ## Trim away H-atoms
##D mol <- trim(mol, "noh")
##D 
## End(Not run)



