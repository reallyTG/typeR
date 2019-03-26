library(MixfMRI)


### Name: Density function of p-values
### Title: Density function of p-values
### Aliases: dpval dmixpval
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
set.seed(1234)
da <- gendataset(phantom = shepp1fMRI, overlap = 0.01)
x <- da$pval[!is.na(da$pval)][1:100]
dpval(x)
dmixpval(x, mu = da$mu, eta = da$eta)



