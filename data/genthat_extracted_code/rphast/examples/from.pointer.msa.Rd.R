library(rphast)


### Name: from.pointer.msa
### Title: MSA From Pointer
### Aliases: from.pointer.msa
### Keywords: msa

### ** Examples

m <- msa(seqs=c("A--ACGTAT", "AG-AGGTAA", "AGGAGGTAG"),
         names=c("human", "mouse", "rat"), pointer.only=TRUE)
m
m <- from.pointer.msa(m)
m



