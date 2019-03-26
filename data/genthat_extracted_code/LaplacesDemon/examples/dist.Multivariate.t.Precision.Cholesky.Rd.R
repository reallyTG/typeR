library(LaplacesDemon)


### Name: dist.Multivariate.t.Precision.Cholesky
### Title: Multivariate t Distribution: Precision-Cholesky Parameterization
### Aliases: dmvtpc rmvtpc
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- seq(-2,4,length=21)
y <- 2*x+10
z <- x+cos(y) 
mu <- c(1,12,2)
Omega <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
U <- chol(Omega)
nu <- 4
f <- dmvtpc(cbind(x,y,z), mu, U, nu)
X <- rmvtpc(1000, c(0,1,2), U, 5)
joint.density.plot(X[,1], X[,2], color=TRUE)



