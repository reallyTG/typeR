library(bio3d)


### Name: as.pdb
### Title: Convert to PDB format
### Aliases: as.pdb as.pdb.mol2 as.pdb.prmtop as.pdb.default
### Keywords: IO

### ** Examples

## Vector(s) to PDB object
pdb <- as.pdb(resno=1:6, elety="CA", resid="ALA", chain="A")
pdb

## Not run: 
##D ## Read a PRMTOP file
##D prmtop <- read.prmtop(system.file("examples/crambin.prmtop", package="bio3d"))
##D 
##D ## Read Amber coordinates
##D crds <- read.crd(system.file("examples/crambin.inpcrd", package="bio3d"))
##D 
##D ## Atom selection
##D ca.inds <- atom.select(prmtop, "calpha")
##D 
##D ## Convert to PDB format
##D pdb <- as.pdb(prmtop, crds, inds=ca.inds)
##D 
##D 
##D ## Read a single entry MOL2 file
##D ## (returns a single object)
##D mol <- read.mol2( system.file("examples/aspirin.mol2", package="bio3d") )
##D 
##D ## Convert to PDB
##D pdb <- as.pdb(mol)
## End(Not run)



