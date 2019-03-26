library(bio3d)


### Name: pdbfit
### Title: PDB File Coordinate Superposition
### Aliases: pdbfit pdbfit.pdb pdbfit.pdbs
### Keywords: utilities

### ** Examples

## Not run: 
##D #files <- get.pdb(c("4q21","5p21"), URLonly=TRUE)
##D files <- get.pdb(c("4q21","5p21"), path=tempdir(), overwrite=TRUE)
##D pdbs <- pdbaln(files)
##D xyz <- pdbfit(pdbs)
##D 
##D # Superpose again this time outputing all-atom PDBs to disc
##D #xyz <- pdbfit( pdbs, outpath="fitted" )
## End(Not run)



