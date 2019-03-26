library(Gmedian)


### Name: WeiszfeldCov
### Title: WeiszfeldCov
### Aliases: WeiszfeldCov
### Keywords: WeiszfeldCov

### ** Examples

## Simulated data - Brownian paths
n <- 1e3
d <- 50
x <- matrix(rnorm(n*d,sd=1/sqrt(d)), n, d)
x <- t(apply(x,1,cumsum))

## Estimation
median.est <- WeiszfeldCov(x)

par(mfrow=c(1,2))
image(median.est$covmedian) ## median covariation function
plot(c(1:d)/d,median.est$vectors[,1]*sqrt(d),type="l",xlab="Time",
ylab="Eigenvectors",ylim=c(-1.4,1.4))
lines(c(1:d)/d,median.est$vectors[,2]*sqrt(d),lty=2)



