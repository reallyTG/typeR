library(tsutils)


### Name: lambdaseq
### Title: Generate sequence of lambda for LASSO regression
### Aliases: lambdaseq
### Keywords: Regression ts

### ** Examples

y <- mtcars[,1]
x <- as.matrix(mtcars[,2:11])
lambda <- lambdaseq(x, y)$lambda

## Not run: 
##D   library(glmnet)
##D   fit.lasso <- cv.glmnet(y, x, lambda = lambda)
##D   coef.lasso <- coef(fit.lasso, s = "lambda.1se")
## End(Not run)




