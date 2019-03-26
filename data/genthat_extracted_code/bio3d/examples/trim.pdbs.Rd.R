library(bio3d)


### Name: trim.pdbs
### Title: Filter or Trim a PDBs Object
### Aliases: trim.pdbs
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Fetch PDB files and split to chain A only PDB files
##D ids <- c("1a70_A", "1czp_A", "1frd_A", "1fxi_A", "1iue_A", "1pfd_A")
##D raw.files <- get.pdb(ids, path = "raw_pdbs")
##D files <- pdbsplit(raw.files, ids, path = "raw_pdbs/split_chain")
##D 
##D ## Sequence Alignement, and connectivity check
##D pdbs <- pdbaln(files)
##D 
##D cons <- inspect.connectivity(pdbs)
##D 
##D ## omit files with missing residues
##D trim.pdbs(pdbs, row.inds=which(cons))
## End(Not run)



