library(rvalues)


### Name: FDRCurve
### Title: FDR Curve
### Aliases: FDRCurve
### Keywords: dplot hstat

### ** Examples

n <- 500
theta <- rnorm(n)
ses <- sqrt(rgamma(n,shape=1,scale=1))
XX <- theta + ses*rnorm(n)
dd <- cbind(XX,ses)

rvs <- rvalues(dd, family = gaussian)

FDRCurve(rvs, q = .1, threshold = .3, cex.main = 1.5)



