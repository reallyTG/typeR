library(rqPen)


### Name: rq.lasso.fit
### Title: Quantile Regression with LASSO penalty
### Aliases: rq.lasso.fit

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
lassoModel <- rq.lasso.fit(x,y,lambda=1)



