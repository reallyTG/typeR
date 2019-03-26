library(LaplacesDemon)


### Name: dist.Multivariate.Cauchy.Precision
### Title: Multivariate Cauchy Distribution: Precision Parameterization
### Aliases: dmvcp rmvcp
### Keywords: Distribution

### ** Examples

library(LaplacesDemon)
x <- seq(-2,4,length=21)
y <- 2*x+10
z <- x+cos(y) 
mu <- c(1,12,2)
Omega <- matrix(c(1,2,0,2,5,0.5,0,0.5,3), 3, 3)
f <- dmvcp(cbind(x,y,z), mu, Omega)

X <- rmvcp(1000, rep(0,2), diag(2))
X <- X[rowSums((X >= quantile(X, probs=0.025)) &
     (X <= quantile(X, probs=0.975)))==2,]
joint.density.plot(X[,1], X[,2], color=TRUE)



