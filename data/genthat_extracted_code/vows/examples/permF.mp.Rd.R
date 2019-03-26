library(vows)


### Name: permF.mp
### Title: Permutation F-tests for massively parallel linear models
### Aliases: permF.mp

### ** Examples


Y = matrix(rnorm(6000), nrow=20)
X = rnorm(20)
t3 = permF.mp(Y~X)



