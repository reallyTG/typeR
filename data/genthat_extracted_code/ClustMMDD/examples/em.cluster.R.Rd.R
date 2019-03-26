library(ClustMMDD)


### Name: em.cluster.R
### Title: Compute estimates of the parameters by Expectation and
###   Maximization algorithm.
### Aliases: em.cluster.R
### Keywords: Classification Clustering Expectation and Maximization
###   Stochastic Expectation and Maximization Classification Expectation
###   and Maximization Maximum a posteriori classification

### ** Examples

data(genotype1)
head(genotype1)
genotype2 = cutEachCol(genotype1[, -11], ploidy = 2)
head(genotype2)

#See the EM options
EmOptions() # Options can be set by \code{setEmOptions()}
par5 = em.cluster.R (genotype2, K = 5, S = c(rep(TRUE, 8), rep(FALSE, 2)), ploidy = 2)
slotNames(par5)
head(par5["membershipProba"])
par5["mixingProportions"]
par5



