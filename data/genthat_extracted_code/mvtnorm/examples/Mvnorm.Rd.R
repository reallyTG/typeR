library(mvtnorm)


### Name: Mvnorm
### Title: Multivariate Normal Density and Random Deviates
### Aliases: dmvnorm rmvnorm
### Keywords: distribution multivariate

### ** Examples

dmvnorm(x=c(0,0))
dmvnorm(x=c(0,0), mean=c(1,1))

sigma <- matrix(c(4,2,2,3), ncol=2)
x <- rmvnorm(n=500, mean=c(1,2), sigma=sigma)
colMeans(x)
var(x)

x <- rmvnorm(n=500, mean=c(1,2), sigma=sigma, method="chol")
colMeans(x)
var(x)

plot(x)



