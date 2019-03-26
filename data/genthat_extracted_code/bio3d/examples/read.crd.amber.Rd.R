library(bio3d)


### Name: read.crd.amber
### Title: Read AMBER Coordinate files
### Aliases: read.crd.amber
### Keywords: IO

### ** Examples

## Not run: 
##D ## Read Amber PRMTOP and CRD files
##D prm <- read.prmtop(system.file("examples/crambin.prmtop", package="bio3d"))
##D crd <- read.crd(system.file("examples/crambin.inpcrd", package="bio3d"))
##D 
##D ## Convert to PDB format
##D pdb <- as.pdb(prm, crd)
##D 
##D ## Atom selection
##D ca.inds <- atom.select(prm, "calpha")
## End(Not run)



