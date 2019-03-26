library(ade4)


### Name: dist.dudi
### Title: Computation of the Distance Matrix from a Statistical Triplet
### Aliases: dist.dudi
### Keywords: array multivariate

### ** Examples

data (meaudret)
pca1 <- dudi.pca(meaudret$env, scan = FALSE)
sum((dist(scalewt(meaudret$env)) - dist.dudi(pca1))^2)
#[1] 4.045e-29 the same thing



