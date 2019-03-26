library(rrcov)


### Name: CovSde
### Title: Stahel-Donoho Estimates of Multivariate Location and Scatter
### Aliases: CovSde
### Keywords: robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
CovSde(hbk.x)

## the following four statements are equivalent
c0 <- CovSde(hbk.x)
c1 <- CovSde(hbk.x, nsamp=2000)
c2 <- CovSde(hbk.x, control = CovControlSde(nsamp=2000))
c3 <- CovSde(hbk.x, control = new("CovControlSde", nsamp=2000))

## direct specification overrides control one:
c4 <- CovSde(hbk.x, nsamp=100,
             control = CovControlSde(nsamp=2000))
c1
summary(c1)
plot(c1)

## Use the function CovRobust() - if no estimation method is
##  specified, for small data sets CovSde() will be called
cr <- CovRobust(hbk.x)
cr




