library(bio3d)


### Name: pdb2aln
### Title: Align a PDB structure to an existing alignment
### Aliases: pdb2aln
### Keywords: utilities

### ** Examples

## Not run: 
##D ##--- Read aligned PDB coordinates (CA only)
##D aln  <- read.fasta(system.file("examples/kif1a.fa",package="bio3d"))
##D pdbs <- read.fasta.pdb(aln)
##D 
##D ##--- Read PDB coordinate for a new structure (all atoms)
##D id <- get.pdb("2kin", URLonly=TRUE)
##D pdb <- read.pdb(id)
##D 
##D # add pdb to the alignment 
##D naln <- pdb2aln(aln=pdbs, pdb=pdb, id=id)
##D naln
##D 
## End(Not run)




