library(MixfMRI)


### Name: False Discovery Rates for Spatial Signals
### Title: False Discovery Rates for Spatial Signals using Benjamini and
###   Heller (2007)
### Aliases: fdr.bh.p1 fdr.bh.p2
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
set.seed(1234)
da <- gendataset(phantom = shepp1fMRI, overlap = 0.01)
p <- da$pval[!is.na(da$pval)][1:100]
fdr.bh.p1(p)
fdr.bh.p2(p)



