library(rqPen)


### Name: LASSO.fit.nonpen
### Title: LASSO Penalized Quantile Regression with some nonpenalized
###   coefficients
### Aliases: LASSO.fit.nonpen

### ** Examples

library(splines)
n = 50
p = 100
x <- matrix(rnorm(n*p),nrow=n)
z1 <- runif(n)
z <- bs(z1)
y <- 0 + x[,1] - 3*x[,5] + z1^3 + rnorm(n)
fit1 <- LASSO.fit.nonpen(y,x,z, tau=.5, lambda=1, intercept=TRUE, coef.cutoff=1e-08)
fit2 <- LASSO.fit.nonpen(y,x,z, tau=.5, lambda=.1, intercept=TRUE, coef.cutoff=1e-08)



