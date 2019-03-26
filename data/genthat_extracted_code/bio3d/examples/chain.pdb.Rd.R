library(bio3d)


### Name: chain.pdb
### Title: Find Possible PDB Chain Breaks
### Aliases: chain.pdb
### Keywords: utilities

### ** Examples

## No test: 
# PDB server connection required - testing excluded

full.pdb <- read.pdb( get.pdb("5p21", URLonly=TRUE) )
inds <- atom.select(full.pdb, resno=c(10:20,30:33))
cut.pdb <- trim.pdb(full.pdb, inds)
chain.pdb(cut.pdb)
## End(No test)



