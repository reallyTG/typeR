library(rphast)


### Name: names.msa
### Title: MSA Sequence Names
### Aliases: names.msa
### Keywords: msa

### ** Examples

m <- msa(seqs=c("ACGTAT", "AGGTAA", "AGGTAG"),
         names=c("human", "mouse", "rat"))
names.msa(m)
m <- msa(seqs=c("ACGTAT", "AGGTAA", "AGGTAG"))
names.msa(m)



