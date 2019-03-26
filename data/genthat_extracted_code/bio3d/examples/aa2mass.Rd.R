library(bio3d)


### Name: aa2mass
### Title: Amino Acid Residues to Mass Converter
### Aliases: aa2mass
### Keywords: utilities

### ** Examples

resi.names <- c("LYS", "ALA", "CYS", "HIS")
masses <- aa2mass(resi.names, addter=FALSE)

## Not run: 
##D ## Fetch atomic masses in a PDB object
##D pdb <- read.pdb("3dnd")
##D masses <- aa2mass(pdb)
##D 
##D ## or
##D masses <- aa2mass(pdb$atom[1:10,"resid"])
##D 
##D ## Dealing with unconventional residues
##D #pdb <- read.pdb("1xj0")
##D 
##D #mass.cust <- list("CSX"=122.166)
##D #masses <- aa2mass(pdb, mass.custom=mass.cust)
## End(Not run)



