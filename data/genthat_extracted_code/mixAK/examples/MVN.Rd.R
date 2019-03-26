library(mixAK)


### Name: MVN
### Title: Multivariate normal distribution
### Aliases: MVN dMVN rMVN rcMVN C_dMVN1_R C_rMVN1_R C_rMVN2_R
### Keywords: distribution multivariate

### ** Examples

set.seed(1977)

### Univariate normal distribution
### ==============================
c(dMVN(0), dnorm(0))
c(dMVN(0, log=TRUE), dnorm(0, log=TRUE))

rbind(dMVN(c(-1, 0, 1)), dnorm(c(-1, 0, 1)))
rbind(dMVN(c(-1, 0, 1), log=TRUE), dnorm(c(-1, 0, 1), log=TRUE))

c(dMVN(1, mean=1.2, Q=0.5), dnorm(1, mean=1.2, sd=sqrt(2)))
c(dMVN(1, mean=1.2, Q=0.5, log=TRUE), dnorm(1, mean=1.2, sd=sqrt(2), log=TRUE))

rbind(dMVN(0:2, mean=1.2, Q=0.5), dnorm(0:2, mean=1.2, sd=sqrt(2)))
rbind(dMVN(0:2, mean=1.2, Q=0.5, log=TRUE), dnorm(0:2, mean=1.2, sd=sqrt(2), log=TRUE))

### Multivariate normal distribution
### ================================
mu <- c(0, 6, 8)
L <- matrix(1:9, nrow=3)
L[upper.tri(L, diag=FALSE)] <- 0
Sigma <- L %*% t(L)
Q <- chol2inv(chol(Sigma))
b <- solve(Sigma, mu)

dMVN(mu, mean=mu, Q=Q)
dMVN(mu, mean=mu, Sigma=Sigma)
dMVN(mu, mean=mu, Q=Q, log=TRUE)
dMVN(mu, mean=mu, Sigma=Sigma, log=TRUE)

xx <- matrix(c(0,6,8, 1,5,7, -0.5,5.5,8.5, 0.5,6.5,7.5), ncol=3, byrow=TRUE)
dMVN(xx, mean=mu, Q=Q)
dMVN(xx, mean=mu, Sigma=Sigma)
dMVN(xx, mean=mu, Q=Q, log=TRUE)
dMVN(xx, mean=mu, Sigma=Sigma, log=TRUE)

zz <- rMVN(1000, mean=mu, Sigma=Sigma)
rbind(apply(zz$x, 2, mean), mu)
var(zz$x)
Sigma
cbind(dMVN(zz$x, mean=mu, Sigma=Sigma, log=TRUE), zz$log.dens)[1:10,]

zz <- rcMVN(1000, b=b, Sigma=Sigma)
rbind(apply(zz$x, 2, mean), mu)
var(zz$x)
Sigma
cbind(dMVN(zz$x, mean=mu, Sigma=Sigma, log=TRUE), zz$log.dens)[1:10,]

zz <- rMVN(1000, mean=rep(0, 3), Sigma=Sigma)
rbind(apply(zz$x, 2, mean), rep(0, 3))
var(zz$x)
Sigma
cbind(dMVN(zz$x, mean=rep(0, 3), Sigma=Sigma, log=TRUE), zz$log.dens)[1:10,]


### The same using the package mvtnorm
### ==================================
# require(mvtnorm)
# c(dMVN(mu, mean=mu, Sigma=Sigma), dmvnorm(mu, mean=mu, sigma=Sigma))
# c(dMVN(mu, mean=mu, Sigma=Sigma, log=TRUE), dmvnorm(mu, mean=mu, sigma=Sigma, log=TRUE))
#
# rbind(dMVN(xx, mean=mu, Sigma=Sigma), dmvnorm(xx, mean=mu, sigma=Sigma))
# rbind(dMVN(xx, mean=mu, Sigma=Sigma, log=TRUE), dmvnorm(xx, mean=mu, sigma=Sigma, log=TRUE))



