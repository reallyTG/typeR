library(mcmcplots)


### Name: parcorplot
### Title: Correlation Plot for MCMC Draws of Model Parameters
### Aliases: parcorplot
### Keywords: hplot

### ** Examples

Rho1 <- outer(1:10, 1:10, function(i, j) 0.5^(abs(i-j)))
Rho2 <- outer(1:5, 1:5, function(i, j) 0.25^(i!=j))
dat1 <- t(apply(matrix(rnorm(10*1000), 1000, 10), 1, function(z, Rho1) t(Rho1)%*%z, Rho1))
dat2 <- t(apply(matrix(rnorm(5*1000), 1000, 5), 1, function(z, Rho2) t(Rho2)%*%z, Rho2))
colnames(dat1) <- paste("theta[", 1:10, "]", sep="")
colnames(dat2) <- paste("alpha[", 1:5, "]", sep="")
dat <- cbind(dat1, dat2)
parcorplot(dat, "theta", col=gray(31:0/31), cex.axis=0.75)
parcorplot(dat, col=heat.colors(31), cex.axis=0.75)
parcorplot(dat, col=topo.colors(31), cex.axis=0.75)
parcorplot(dat, col=terrain.colors(31), cex.axis=0.75)
parcorplot(dat, col=cm.colors(31), cex.axis=0.75)



