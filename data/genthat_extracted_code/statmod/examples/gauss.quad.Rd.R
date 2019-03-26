library(statmod)


### Name: gauss.quad
### Title: Gaussian Quadrature
### Aliases: gauss.quad
### Keywords: math

### ** Examples

#  mean of gamma distribution with alpha=6
out <- gauss.quad(10,"laguerre",alpha=5)
sum(out$weights * out$nodes) / gamma(6)



