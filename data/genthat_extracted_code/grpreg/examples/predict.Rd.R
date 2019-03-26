library(grpreg)


### Name: predict.grpreg
### Title: Model predictions based on a fitted 'grpreg' object
### Aliases: predict.grpreg coef.grpreg predict.cv.grpreg coef.cv.grpreg

### ** Examples

# Fit penalized logistic regression model to birthweight data
data(Birthwt)
X <- Birthwt$X
y <- Birthwt$low
group <- Birthwt$group
fit <- grpreg(X, y, group, penalty="grLasso", family="binomial")

# Coef and predict methods
coef(fit, lambda=.001)
predict(fit, X, type="link", lambda=.07)[1:10]
predict(fit, X, type="response", lambda=.07)[1:10]
predict(fit, X, type="class", lambda=.01)[1:15]
predict(fit, type="vars", lambda=.07)
predict(fit, type="groups", lambda=.07)
predict(fit, type="norm", lambda=.07)

# Coef and predict methods for cross-validation
cvfit <- cv.grpreg(X, y, group, family="binomial", penalty="grMCP")
coef(cvfit)
predict(cvfit, X)[1:10]
predict(cvfit, X, type="response")[1:10]
predict(cvfit, type="groups")



