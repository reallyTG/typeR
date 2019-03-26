library(bio3d)


### Name: biounit
### Title: Biological Units Construction
### Aliases: biounit

### ** Examples

## No test: 
   # PDB server connection required - testing excluded

   pdb <- read.pdb("2dn1")
   biounit <- biounit(pdb)
   pdb
   biounit
## End(No test)
## Not run: 
##D    biounit <- biounit(read.pdb("2bfu"), multi=TRUE)
##D    write.pdb(biounit[[1]], file="biounit.pdb")
##D    # open the pdb file in VMD to have a look on the biological unit
## End(Not run) 



