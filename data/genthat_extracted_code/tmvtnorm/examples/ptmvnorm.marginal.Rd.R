library(tmvtnorm)


### Name: ptmvtnorm.marginal
### Title: One-dimensional marginal CDF function for a Truncated
###   Multivariate Normal and Student t distribution
### Aliases: ptmvnorm.marginal ptmvt.marginal
### Keywords: distribution multivariate

### ** Examples

## Example 1: Truncated multi-normal
lower <- c(-1,-1,-1)
upper <- c(1,1,1)
mean <- c(0,0,0)
sigma <- matrix(c(  1, 0.8, 0.2, 
                  0.8,   1, 0.1,
                  0.2, 0.1,   1), 3, 3)

X <- rtmvnorm(n=1000, mean=c(0,0,0), sigma=sigma, lower=lower, upper=upper)

x <- seq(-1, 1, by=0.01)
Fx <- ptmvnorm.marginal(xn=x, n=1, mean=c(0,0,0), sigma=sigma, lower=lower, upper=upper) 

plot(ecdf(X[,1]), main="marginal CDF for truncated multi-normal")
lines(x, Fx, type="l", col="blue")

## Example 2: Truncated multi-t
X <- rtmvt(n=1000, mean=c(0,0,0), sigma=sigma, df=2, lower=lower, upper=upper)

x <- seq(-1, 1, by=0.01)
Fx <- ptmvt.marginal(xn=x, n=1, mean=c(0,0,0), sigma=sigma, lower=lower, upper=upper) 

plot(ecdf(X[,1]), main="marginal CDF for truncated multi-t")
lines(x, Fx, type="l", col="blue")



