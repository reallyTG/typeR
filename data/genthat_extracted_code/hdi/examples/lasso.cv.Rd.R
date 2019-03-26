library(hdi)


### Name: lasso.cv
### Title: Select Predictors via (10-fold) Cross-Validation of the Lasso
### Aliases: lasso.cv
### Keywords: models regression

### ** Examples

x <- matrix(rnorm(100*1000), nrow = 100, ncol = 1000)
y <- x[,1] * 2 + x[,2] * 2.5 + rnorm(100)
sel <- lasso.cv(x, y)
sel



