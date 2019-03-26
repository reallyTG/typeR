library(mixAK)


### Name: MVT
### Title: Multivariate Student t distribution
### Aliases: MVT dMVT rMVT C_rMVT1_R C_dMVT1_R C_deriv_ldMVT_x
### Keywords: distribution multivariate

### ** Examples

set.seed(1977)

### Univariate central t distribution
z <- rMVT(10, df=1, mu=0, Q=1)
ldz <- dMVT(z$x, df=1, log=TRUE)
boxplot(as.numeric(z$x))
cbind(z$log.dens, ldz, dt(as.numeric(z$x), df=1, log=TRUE))

### Multivariate t distribution
mu <- c(1, 2, 3)
Sigma <- matrix(c(1, 1, -1.5,  1, 4, 1.8,  -1.5, 1.8, 9), nrow=3)
Q <- chol2inv(chol(Sigma))

nu <- 3
z <- rMVT(1000, df=nu, mu=mu, Sigma=Sigma)
apply(z$x, 2, mean)              ## should be close to mu
((nu - 2) / nu) * var(z$x)       ## should be close to Sigma            

dz <- dMVT(z$x, df=nu, mu=mu, Sigma=Sigma)
ldz <- dMVT(z$x, df=nu, mu=mu, Sigma=Sigma, log=TRUE)

### Compare with mvtnorm package
#require(mvtnorm)
#ldz2 <- dmvt(z$x, sigma=Sigma, df=nu, delta=mu, log=TRUE)
#plot(z$log.dens, ldz2, pch=21, col="red3", bg="orange", xlab="mixAK", ylab="mvtnorm")
#plot(ldz, ldz2, pch=21, col="red3", bg="orange", xlab="mixAK", ylab="mvtnorm")



