library(iilasso)


### Name: logit_lasso
### Title: Fit a logistic regression model using a design matrix
### Aliases: logit_lasso

### ** Examples

X <- matrix(c(1,2,3,5,4,7,6,8,9,10), nrow=5, ncol=2)
b <- matrix(c(-1,1), nrow=2, ncol=1)
e <- matrix(c(0,-0.1,0.1,-0.1,0.1), nrow=5, ncol=1)
y <- as.numeric(X %*% b + e)
y <- ifelse(y>mean(y), 1, 0)
fit <- lasso(X, y, family="binomial")
pr <- predict_lasso(fit, X)
plot_lasso(fit)



