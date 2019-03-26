library(BiodiversityR)


### Name: radfitresult
### Title: Alternative Rank Abundance Fitting Results
### Aliases: radfitresult
### Keywords: multivariate

### ** Examples

library(vegan)
data(BCI)
BCIall <- t(as.matrix(colSums(BCI)))
radfitresult(BCIall)



