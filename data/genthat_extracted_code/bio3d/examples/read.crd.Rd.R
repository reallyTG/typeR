library(bio3d)


### Name: read.crd
### Title: Read Coordinate Data from Amber or Charmm
### Aliases: read.crd
### Keywords: IO

### ** Examples

## Not run: 
##D ## Read a PRMTOP file
##D prmtop <- read.prmtop(system.file("examples/crambin.prmtop", package="bio3d"))
##D print(prmtop)
##D 
##D ## Read a Amber CRD file
##D crds <- read.crd(system.file("examples/crambin.inpcrd", package="bio3d"))
##D 
##D ## Atom selection
##D ca.inds <- atom.select(prmtop, "calpha")
##D 
##D ## Convert to PDB format
##D pdb <- as.pdb(prmtop, crds, inds=ca.inds)
## End(Not run)



