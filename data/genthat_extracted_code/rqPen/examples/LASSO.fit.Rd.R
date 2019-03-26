library(rqPen)


### Name: LASSO.fit
### Title: LASSO Penalized Quantile Regression
### Aliases: LASSO.fit

### ** Examples

n = 50
p = 100
x <- matrix(rnorm(n*p),nrow=n)
y <- 0 + x[,1] - 3*x[,5] + rnorm(n)
fit1 <- LASSO.fit(y,x, tau=.5, lambda=1, intercept=TRUE, coef.cutoff=1e-08)
fit2 <- LASSO.fit(y,x, tau=.5, lambda=.1, intercept=TRUE, coef.cutoff=1e-08)



