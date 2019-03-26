library(bio3d)


### Name: read.prmtop
### Title: Read AMBER Parameter/Topology files
### Aliases: read.prmtop print.prmtop
### Keywords: IO

### ** Examples

## Not run: 
##D ## Read a PRMTOP file
##D prmtop <- read.prmtop(system.file("examples/crambin.prmtop", package="bio3d"))
##D print(prmtop)
##D 
##D ## Explore prmtop file
##D head(prmtop$MASS)
##D head(prmtop$ATOM_NAME)
##D 
##D ## Read Amber coordinates
##D crds <- read.crd(system.file("examples/crambin.inpcrd", package="bio3d"))
##D 
##D ## Atom selection
##D ca.inds <- atom.select(prmtop, "calpha")
##D 
##D ## Convert to PDB format
##D pdb <- as.pdb(prmtop, crds)
##D pdb.ca <- as.pdb(prmtop, crds, inds=ca.inds)
##D 
##D ## Trajectory processing
##D #trj <- read.ncdf("traj.nc", at.sel=ca.inds)
##D 
##D ## Convert to multimodel PDB format
##D #pdb <- as.pdb(prmtop, trj[1:20,], inds=ca.inds, inds.crd=NULL)
##D 
##D ## RMSD of trajectory
##D #rd <- rmsd(crds$xyz[ca.inds$xyz], traj, fit=TRUE)
## End(Not run)



