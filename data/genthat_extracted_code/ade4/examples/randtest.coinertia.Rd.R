library(ade4)


### Name: randtest.coinertia
### Title: Monte-Carlo test on a Co-inertia analysis (in C).
### Aliases: randtest.coinertia
### Keywords: multivariate nonparametric

### ** Examples

data(doubs)
dudi1 <- dudi.pca(doubs$env, scale = TRUE, scan = FALSE, nf = 3)
dudi2 <- dudi.pca(doubs$fish, scale = FALSE, scan = FALSE, nf = 2)
coin1 <- coinertia(dudi1,dudi2, scan = FALSE, nf = 2)
plot(randtest(coin1))
 


