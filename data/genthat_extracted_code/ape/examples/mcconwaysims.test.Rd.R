library(ape)


### Name: mcconwaysims.test
### Title: McConway-Sims Test of Homogeneous Diversification
### Aliases: mcconwaysims.test
### Keywords: htest

### ** Examples

### simulate 10 clades with lambda = 0.1 and mu = 0.09:
n0 <- replicate(10, balance(rbdtree(.1, .09, Tmax = 35))[1])
### simulate 10 clades with lambda = 0.15 and mu = 0.1:
n1 <- replicate(10, balance(rbdtree(.15, .1, Tmax = 35))[1])
x <- cbind(n1, n0)
mcconwaysims.test(x)
slowinskiguyer.test(x)
richness.yule.test(x, 35)



