library(ACSWR)


### Name: hw
### Title: Height-Weight Covariance Study
### Aliases: hw
### Keywords: testing mean vector

### ** Examples

data(hw)
sigma0 <- matrix(c(20, 100, 100, 1000),nrow=2)
sigma <- var(hw)
v <- nrow(hw)-1
p <- ncol(hw)
u <- v*(log(det(sigma0))-log(det(sigma)) + sum(diag(sigma%*%solve(sigma0)))-p)
u1 <- (1- (1/(6*v-1))*(2*p+1 - 2/(p+1)))*u
u;u1;qchisq(1-0.05,p*(p+1)/2)



