library(hierDiversity)


### Name: dz
### Title: Effective Numbers for Alpha, Beta, and Gamma Diversity Indices
### Aliases: dz
### Keywords: biodiversity phenotypic diversity

### ** Examples

set.seed(2)
dat <- matrix(rpois(100, lambda = 3), nrow = 10)
dz(abundances = dat, lev = "beta", q = 2)
#1.336



