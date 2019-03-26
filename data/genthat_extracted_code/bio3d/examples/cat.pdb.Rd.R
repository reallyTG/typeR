library(bio3d)


### Name: cat.pdb
### Title: Concatenate Multiple PDB Objects
### Aliases: cat.pdb
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Read a PDB file from the RCSB online database
##D pdb1 <- read.pdb("1etl")
##D pdb2 <- read.pdb("1hel")
##D 
##D ## Concat
##D new.pdb <- cat.pdb(pdb1, pdb2, pdb1, rechain=TRUE, renumber=TRUE)
##D 
##D ## Write to file
##D write.pdb(new.pdb, file="concat.pdb")
## End(Not run)



