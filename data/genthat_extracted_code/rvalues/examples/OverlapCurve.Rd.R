library(rvalues)


### Name: OverlapCurve
### Title: Overlap Curve
### Aliases: OverlapCurve
### Keywords: dplot htest

### ** Examples

n <- 500
theta <- rnorm(n)
ses <- sqrt(rgamma(n,shape=1,scale=1))
XX <- theta + ses*rnorm(n)
dd <- cbind(XX,ses)

rvs <- rvalues(dd, family = gaussian)

OverlapCurve(rvs, cex.main = 1.5)



