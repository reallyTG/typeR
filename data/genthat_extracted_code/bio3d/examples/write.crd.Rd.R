library(bio3d)


### Name: write.crd
### Title: Write CRD File
### Aliases: write.crd
### Keywords: IO

### ** Examples

## Not run: 
##D # Read a PDB file
##D pdb <- read.pdb( "1bg2" )
##D summary(pdb)
##D # Convert to CHARMM format
##D new <- convert.pdb(pdb, type="charmm")
##D summary(new)
##D # Write a CRD file
##D write.crd(new, file="4charmm.crd")
## End(Not run)



