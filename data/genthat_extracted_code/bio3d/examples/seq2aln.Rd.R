library(bio3d)


### Name: seq2aln
### Title: Add a Sequence to an Existing Alignmnet
### Aliases: seq2aln
### Keywords: utilities

### ** Examples


## Not run: 
##D aa.1 <- pdbseq( read.pdb("1bg2") )
##D aa.2 <- pdbseq( read.pdb("3dc4") )
##D aa.3 <- pdbseq( read.pdb("1mkj") )
##D 
##D aln <- seqaln( seqbind(aa.1,aa.2) )
##D 
##D seq2aln(aa.3, aln)
## End(Not run)




