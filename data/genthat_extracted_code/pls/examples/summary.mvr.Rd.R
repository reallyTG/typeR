library(pls)


### Name: summary.mvr
### Title: Summary and Print Methods for PLSR and PCR objects
### Aliases: summary.mvr print.mvr print.mvrVal
### Keywords: regression multivariate

### ** Examples

data(yarn)
nir.mvr <- mvr(density ~ NIR, ncomp = 8, validation = "LOO", data = yarn)
nir.mvr
summary(nir.mvr)
RMSEP(nir.mvr)



