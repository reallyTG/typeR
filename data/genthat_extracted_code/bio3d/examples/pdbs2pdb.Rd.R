library(bio3d)


### Name: pdbs2pdb
### Title: PDBs to PDB Converter
### Aliases: pdbs2pdb
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Fetch PDBs
##D pdb.ids <- c("1YX5_B", "3NOB", "1P3Q_U")
##D #outdir <- paste(tempdir(), "/raw_pdbs", sep="")
##D outdir = "raw_pdbs"
##D raw.files <- get.pdb(pdb.ids, path = outdir)
##D 
##D ## Split PDBs by chain ID and multi-model records
##D all.files <- pdbsplit(raw.files, pdb.ids, 
##D                 path =paste(outdir, "/split_chain", sep=""))
##D 
##D ## Align and fit
##D pdbs     <- pdbaln(all.files, fit=TRUE)
##D 
##D ## Convert back to PDB objects
##D all.pdbs <- pdbs2pdb(pdbs)
##D 
##D ## Access the first PDB object
##D ## all.pdbs[[1]]
##D 
##D ## Return PDB objects consisting of only
##D ## atoms in non-gap positions
##D all.pdbs <- pdbs2pdb(pdbs, rm.gaps=TRUE)
##D 
## End(Not run)



