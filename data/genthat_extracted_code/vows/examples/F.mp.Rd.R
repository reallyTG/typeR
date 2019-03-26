library(vows)


### Name: F.mp
### Title: F-tests for massively parallel linear models
### Aliases: F.mp

### ** Examples


Y = matrix(rnorm(6000), nrow=20)
X = rnorm(20)
t2 = F.mp(Y~X, which=2)



