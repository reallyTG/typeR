library(statmod)


### Name: gauss.quad.prob
### Title: Gaussian Quadrature with Probability Distributions
### Aliases: gauss.quad.prob
### Keywords: math

### ** Examples

#  the 4th moment of the standard normal is 3
out <- gauss.quad.prob(10,"normal")
sum(out$weights * out$nodes^4)

#  the expected value of log(X) where X is gamma is digamma(alpha)
out <- gauss.quad.prob(32,"gamma",alpha=5)
sum(out$weights * log(out$nodes))



