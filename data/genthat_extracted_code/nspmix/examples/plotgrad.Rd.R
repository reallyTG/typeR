library(nspmix)


### Name: plotgrad
### Title: Plot the Gradient Function
### Aliases: plotgrad
### Keywords: function

### ** Examples

## Poisson mixture
x = rnppois(200, c(1,4), c(0.7,0.3))
r = cnm(x)
plotgrad(x, r$mix)

## Normal mixture
x = rnpnorm(200, mu=c(0,4), pr=c(0.3,0.7), sd=1)
r = cnm(x, init=list(beta=0.5))   # sd = 0.5
plotgrad(x, r$mix, r$beta)




