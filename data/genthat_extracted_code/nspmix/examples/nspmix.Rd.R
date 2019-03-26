library(nspmix)


### Name: nspmix
### Title: Class 'nspmix'
### Aliases: nspmix plot.nspmix
### Keywords: function

### ** Examples

## Poisson mixture
x = rnppois(200, c(1,4), c(0.7,0.3))
r = cnm(x)
plot(r, x, "p")
plot(r, x, "g")

## Normal mixture
x = rnpnorm(200, mu=c(0,4), pr=c(0.3,0.7), sd=1)
r = cnm(x, init=list(beta=0.5))   # sd = 0.5
plot(r, x, "p")
plot(r, x, "g")




