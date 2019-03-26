library(iilasso)


### Name: plot_cv_lasso
### Title: Plot a cross validation error path
### Aliases: plot_cv_lasso

### ** Examples

X <- matrix(c(1,2,3,5,4,7,6,8,9,10), nrow=5, ncol=2)
b <- matrix(c(-1,1), nrow=2, ncol=1)
e <- matrix(c(0,-0.1,0.1,-0.1,0.1), nrow=5, ncol=1)
y <- as.numeric(X %*% b + e)
cv_fit <- cv_lasso(X, y, nfolds=5)
fit <- cv_fit$fit
pr <- predict_lasso(fit, X, cv_fit$lambda.min)
plot_cv_lasso(cv_fit)



