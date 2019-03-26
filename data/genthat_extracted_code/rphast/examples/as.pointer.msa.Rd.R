library(rphast)


### Name: as.pointer.msa
### Title: MSA To Pointer
### Aliases: as.pointer.msa
### Keywords: msa

### ** Examples

m <- msa(seqs=c("A--ACGTAT", "AG-AGGTAA", "AGGAGGTAG"),
         names=c("human", "mouse", "rat"))
m
m <- as.pointer.msa(m)
m



