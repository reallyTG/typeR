library(Compositional)


### Name: Kullback-Leibler divergence and Bhattacharyya distance between two Dirichlet distributions
### Title: Kullback-Leibler divergence and Bhattacharyya distance between
###   two Dirichlet distributions
### Aliases: kl.diri
### Keywords: Kullback-Leibler divergence Bhattacharyya distance Dirichlet
###   distribution

### ** Examples

library(MASS)
a <- runif(10, 0, 20)
b <- runif(10, 1, 10)
kl.diri(a, b)
kl.diri(b, a)
kl.diri(a, b, type = "bhatt")
kl.diri(b, a, type = "bhatt")



