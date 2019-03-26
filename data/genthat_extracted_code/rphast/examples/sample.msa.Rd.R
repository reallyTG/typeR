library(rphast)


### Name: sample.msa
### Title: Sample columns from an MSA
### Aliases: sample.msa
### Keywords: msa

### ** Examples

m <- msa(seqs=c("AAAAAAAAAACCCCCGGT", "GGGGGGGGGGTTTTTCCA", "CCCCCCCCCCAAAAAGGA"),
         names=c("human", "mouse", "rat"))
sample.msa(m, 10, replace=TRUE)
sample.msa(m, 10, replace=TRUE, prob=c(rep(1, 10), rep(2, 5), rep(5, 2), 10))



