library(bio3d)


### Name: convert.pdb
### Title: Renumber and Convert Between Various PDB formats
### Aliases: convert.pdb
### Keywords: utilities

### ** Examples

## Not run: 
##D 
##D # Read a PDB file
##D pdb <- read.pdb("4q21")
##D pdb
##D head( pdb$atom[pdb$calpha,"resno"] )
##D 
##D # Convert to CHARMM format
##D new <- convert.pdb(pdb, type="amber", renumber=TRUE, first.resno=22 )
##D head( new$atom[new$calpha,"resno"] )
##D 
##D # Write a PDB file
##D #write.pdb(new, file="tmp4amber.pdb")
##D 
## End(Not run)



