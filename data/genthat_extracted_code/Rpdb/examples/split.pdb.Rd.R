library(Rpdb)


### Name: split.pdb
### Title: Divide and Reassemble 'pdb' Objects
### Aliases: split.pdb unsplit.pdb
### Keywords: category

### ** Examples

## Not run: 
##D ## Split a pdb file by residue IDs and write them into separated files
##D x <- read.pdb(system.file("examples/PCBM_ODCB.pdb",package="Rpdb"))
##D file.names <- paste0(x$atoms$resname,"_",x$atoms$resid,".pdb")
##D file.names <- unique(file.names)
##D pdb.resid <- split(x, x$atoms$resid)
##D useless <- mapply(write.pdb, pdb.resid, file.names)
## End(Not run)




