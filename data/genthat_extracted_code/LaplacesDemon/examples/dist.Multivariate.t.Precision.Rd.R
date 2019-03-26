library(LaplacesDemon)


### Name: dist.Multivariate.t.Precision
### Title: Multivariate t Distribution: Precision Parameterization
### Aliases: dmvtp rmvtp
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- seq(-2,4,length=21)
y <- 2*x+10
z <- x+cos(y) 
mu <- c(1,12,2)
Omega <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
nu <- 4
f <- dmvtp(cbind(x,y,z), mu, Omega, nu)
X <- rmvtp(1000, c(0,1,2), diag(3), 5)
joint.density.plot(X[,1], X[,2], color=TRUE)



