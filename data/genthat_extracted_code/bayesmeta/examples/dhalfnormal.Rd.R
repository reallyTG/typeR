library(bayesmeta)


### Name: dhalfnormal
### Title: Half-normal, half-Student-t and half-Cauchy distributions.
### Aliases: dhalfnormal phalfnormal qhalfnormal rhalfnormal dhalft phalft
###   qhalft rhalft dhalfcauchy phalfcauchy qhalfcauchy rhalfcauchy
### Keywords: distribution

### ** Examples

#######################
# illustrate densities:
x <- seq(0,6,le=200)
plot(x, dhalfnormal(x), type="l", col="red", ylim=c(0,1),
     xlab=expression(tau), ylab=expression("probability density "*f(tau)))
lines(x, dhalft(x, df=3), col="green")
lines(x, dhalfcauchy(x), col="blue")
lines(x, dexp(x), col="cyan")
abline(h=0, v=0, col="grey")

# show log-densities (note the differing tail behaviour):
plot(x, dhalfnormal(x), type="l", col="red", ylim=c(0.001,1), log="y",
     xlab=expression(tau), ylab=expression("probability density "*f(tau)))
lines(x, dhalft(x, df=3), col="green")
lines(x, dhalfcauchy(x), col="blue")
lines(x, dexp(x), col="cyan")
abline(v=0, col="grey")



