library(nspmix)


### Name: cnm
### Title: Maximum Likelihood Estimation of a Nonparametric Mixture Model
### Aliases: cnm
### Keywords: function

### ** Examples

## Simulated data
x = rnppois(1000, c(1,4), c(0.7,0.3)) # Poisson mixture
(r = cnm(x))
plot(r, x)

x = rnpnorm(1000, mu=c(0,4), pr=c(0.3,0.7), sd=1) # Normal mixture
plot(cnm(x), x)                        # sd = 1
plot(cnm(x, init=list(beta=0.5)), x)   # sd = 0.5
mix0 = disc(seq(min(x$v),max(x$v), len=100)) # over a finite grid
plot(cnm(x, init=list(beta=0.5, mix=mix0), model="p"),
     x, add=TRUE, col="blue")          # An approximate NPMLE

## Real-world data
data(thai)
plot(cnm(x <- nppois(thai)), x)     # Poisson mixture

data(brca)
plot(cnm(x <- npnorm(brca)), x)     # Normal mixture




