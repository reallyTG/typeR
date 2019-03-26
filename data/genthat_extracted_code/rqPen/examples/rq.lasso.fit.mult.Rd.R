library(rqPen)


### Name: rq.lasso.fit.mult
### Title: Fit Quantile Regression model for varying quantiles with LASSO
###   penalty
### Aliases: rq.lasso.fit.mult

### ** Examples

x <- matrix(rnorm(800),nrow=100)
y <- 1 + x[,1] - 3*x[,5] + rnorm(100)
lassoModel <- rq.lasso.fit.mult(x,y,lambda=1)



