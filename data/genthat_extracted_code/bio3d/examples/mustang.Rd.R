library(bio3d)


### Name: mustang
### Title: Structure-based Sequence Alignment with MUSTANG
### Aliases: mustang
### Keywords: utilities

### ** Examples

## Not run: 
##D 
##D if(!check.utility('mustang')) {
##D    message('Need MUSTANG installed to run this example')
##D } else {
##D 
##D ## Fetch PDB files and split to chain A only PDB files
##D ids <- c("1a70_A", "1czp_A", "1frd_A")
##D files <- get.pdb(ids, split = TRUE, path = tempdir())
##D 
##D ##-- Or, read a folder/directory of existing PDB files
##D #pdb.path <- "my_dir_of_pdbs"
##D #files  <- list.files(path=pdb.path ,
##D #                     pattern=".pdb",
##D #                     full.names=TRUE)
##D 
##D ##-- Align these PDB sequences
##D aln <- mustang(files)
##D 
##D ##-- Read Aligned PDBs storing coordinate data
##D pdbs <- read.fasta.pdb(aln) 
##D 
##D }
## End(Not run)



