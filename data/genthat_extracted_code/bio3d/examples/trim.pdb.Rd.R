library(bio3d)


### Name: trim
### Title: Trim a PDB Object To A Subset of Atoms.
### Aliases: trim trim.pdb
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Read a PDB file from the RCSB online database
##D pdb <- read.pdb("1bg2")
##D 
##D ## Select calpha atoms
##D sele <- atom.select(pdb, "calpha")
##D 
##D ## Trim PDB
##D new.pdb <- trim.pdb(pdb, inds=sele)
##D 
##D ## Or, simply
##D #new.pdb <- trim.pdb(pdb, "calpha")
##D 
##D ## Write to file
##D write.pdb(new.pdb, file="calpha.pdb")
## End(Not run)



