library(FAmle)


### Name: print.mle
### Title: Maximum Likelihood Estimation of Univariate Probability
###   Distributions
### Aliases: print.mle
### Keywords: print models

### ** Examples

data(yarns)
x <- yarns$x
fit.x <- mle(x,'gamma',c(.1,.1))
print(fit.x)
print.mle(fit.x)



