library(bio3d)


### Name: pdbaln
### Title: Sequence Alignment of PDB Files
### Aliases: pdbaln
### Keywords: utilities

### ** Examples

## Not run: 
##D ##- Align PDBs (from vector of filenames)
##D #files <- get.pdb(c("4q21","5p21"), URLonly=TRUE)
##D files <- get.pdb(c("4q21","5p21"), path=tempdir(), overwrite=TRUE)
##D pdbaln(files)
##D 
##D 
##D ##- Align PDBs (from list of existing PDB objects)
##D pdblist <- list(read.pdb(files[1]), read.pdb(files[2]))
##D pdbaln(pdblist)
##D 
## End(Not run)



