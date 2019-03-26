library(ade4)


### Name: RV.rtest
### Title: Monte-Carlo Test on the sum of eigenvalues of a co-inertia
###   analysis (in R).
### Aliases: RV.rtest
### Keywords: multivariate nonparametric

### ** Examples

data(doubs)
pca1 <- dudi.pca(doubs$env, scal = TRUE, scann = FALSE)
pca2 <- dudi.pca(doubs$fish, scal = FALSE, scann = FALSE)
rv1 <- RV.rtest(pca1$tab, pca2$tab, 99)
rv1
plot(rv1)



