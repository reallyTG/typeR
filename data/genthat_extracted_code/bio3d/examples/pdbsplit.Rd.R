library(bio3d)


### Name: pdbsplit
### Title: Split a PDB File Into Separate Files, One For Each Chain.
### Aliases: pdbsplit
### Keywords: utilities

### ** Examples

## Not run: 
##D   ## Save separate PDB files for each chain of a local or on-line file
##D   pdbsplit( get.pdb("2KIN", URLonly=TRUE) )
##D 
##D 
##D   ## Split several PDBs by chain ID and multi-model records
##D   raw.files <- get.pdb( c("1YX5", "3NOB") , URLonly=TRUE)
##D   chain.files <- pdbsplit(raw.files,  path=tempdir(), multi=TRUE)
##D   basename(chain.files)
##D 
##D 
##D   ## Output only desired pdbID_chainID combinations
##D   ## for the last entry (1f9j), fetch all chains
##D   ids <- c("1YX5_A", "3NOB_B", "1F9J")
##D   raw.files <- get.pdb( ids , URLonly=TRUE)
##D   chain.files <- pdbsplit(raw.files, ids, path=tempdir())
##D   basename(chain.files)
## End(Not run)



