library(bio3d)


### Name: motif.find
### Title: Find Sequence Motifs.
### Aliases: motif.find
### Keywords: utilities

### ** Examples

## No test: 
# PDB server connection required - testing excluded

aa.seq <- pdbseq( read.pdb( get.pdb("4q21", URLonly=TRUE) ) )
motif = c("G....GKS")
motif.find(motif, aa.seq)
## End(No test)



