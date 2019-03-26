library(aster)


### Name: families
### Title: Families for Aster Models
### Aliases: families fam.bernoulli fam.poisson fam.truncated.poisson
###   fam.negative.binomial fam.truncated.negative.binomial
###   fam.normal.location fam.default famfun
### Keywords: misc

### ** Examples

### mean of poisson with mean 0.2
famfun(fam.poisson(), 1, log(0.2))
### variance of poisson with mean 0.2
famfun(fam.poisson(), 2, log(0.2))
### mean of poisson with mean 0.2 conditioned on being nonzero
famfun(fam.truncated.poisson(trunc = 0), 1, log(0.2))
### variance of poisson with mean 0.2 conditioned on being nonzero
famfun(fam.truncated.poisson(trunc = 0), 2, log(0.2))



