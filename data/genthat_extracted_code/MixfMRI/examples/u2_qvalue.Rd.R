library(MixfMRI)


### Name: Compute Q values
### Title: Q-values using Benjamini and Hochberg (1995)
### Aliases: qvalue
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
set.seed(1234)
da <- gendataset(phantom = shepp1fMRI, overlap = 0.01)
p <- da$pval[!is.na(da$pval)][1:100]
qvalue(p)



