library(factorcpt)


### Name: factor.seg.alg
### Title: Simultaneous multiple change-point and factor analysis for
###   high-dimensional time series
### Aliases: factor.seg.alg

### ** Examples

n <- 50; T <- 200
e <- matrix(rnorm(n*T), nrow=n) # idiosyncratic components
r <- 3 # factor number
Lam <- matrix(rnorm(n*r, 1, 1), nrow=n) # loadings
f <- matrix(rnorm(r*T), nrow=r) # factors
chi <- e*0 # common component
chp <- T/2 # change-point
chi[, 1:chp] <- Lam%*%f[, 1:chp]
Lam <- Lam + matrix(rnorm(n*r, 0, sqrt(2)), nrow=n) # new loadings
chi[, (chp+1):T] <- Lam%*%f[, (chp+1):T]
x <- chi + sqrt(r)*e

fsa <- factor.seg.alg(x, idio.diag=TRUE)
fsa$common.est.cps
fsa$idio.est.cps
fsa$q.seq



