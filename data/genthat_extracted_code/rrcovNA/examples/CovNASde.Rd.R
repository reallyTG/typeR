library(rrcovNA)


### Name: CovNASde
### Title: Stahel-Donoho Estimates of Multivariate Location and Scatter for
###   incomplete data
### Aliases: CovNASde
### Keywords: robust multivariate

### ** Examples

data(bush10)
CovNASde(bush10)

## the following four statements are equivalent
c0 <- CovNASde(bush10)
c1 <- CovNASde(bush10, nsamp=2000)
c2 <- CovNASde(bush10, control = CovControlSde(nsamp=2000))
c3 <- CovNASde(bush10, control = new("CovControlSde", nsamp=2000))

## direct specification overrides control one:
c4 <- CovNASde(bush10, nsamp=100,
             control = CovControlSde(nsamp=2000))
c1
summary(c1)



