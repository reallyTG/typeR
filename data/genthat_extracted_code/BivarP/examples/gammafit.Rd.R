library(BivarP)


### Name: gammafit
### Title: Estimation of parameters of the Gamma distribution
### Aliases: gammafit
### Keywords: ~kwd1 ~kwd2

### ** Examples

n <- 30
t <- rgamma(n, shape=2, scale=100)
ev <- round(runif(n), 0)
gammafit(t, ev)



