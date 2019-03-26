library(biglasso)


### Name: predict.biglasso
### Title: Model predictions based on a fitted 'biglasso' object
### Aliases: predict.biglasso coef.biglasso
### Keywords: models regression

### ** Examples

## Logistic regression
data(colon)
X <- colon$X
y <- colon$y
X.bm <- as.big.matrix(X)
fit <- biglasso(X.bm, y, penalty = 'lasso', family = "binomial")
coef <- coef(fit, lambda=0.05, drop = TRUE)
coef[which(coef != 0)]
predict(fit, X.bm, type="link", lambda=0.05)
predict(fit, X.bm, type="response", lambda=0.05)
predict(fit, X.bm, type="class", lambda=0.1)
predict(fit, type="vars", lambda=c(0.05, 0.1))
predict(fit, type="nvars", lambda=c(0.05, 0.1))



