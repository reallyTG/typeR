library(rphast)


### Name: ncol.msa
### Title: MSA Sequence Length.
### Aliases: ncol.msa
### Keywords: msa

### ** Examples

m <- msa(seqs=c("A--ACGTAT", "AG-AGGTAA", "AGGAGGTAG"),
         names=c("human", "mouse", "rat"))
ncol.msa(m)
ncol.msa(m, names.msa(m))



