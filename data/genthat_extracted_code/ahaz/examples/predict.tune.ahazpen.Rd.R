library(ahaz)


### Name: predict.tune.ahazpen
### Title: Prediction methods for tune.ahazpen
### Aliases: predict.tune.ahazpen coef.tune.ahazpen
### Keywords: methods

### ** Examples

data(sorlie)

set.seed(10101)

# Break ties
time <- sorlie$time+runif(nrow(sorlie))*1e-2

# Survival data + covariates
surv <- Surv(time,sorlie$status)
X <- as.matrix(sorlie[,3:ncol(sorlie)])

# Fit additive hazards regression model w/lasso penalty
cv.fit <- tune.ahazpen(surv, X, dfmax=100, tune="cv")

# Predict coefficients at cv.fit$lambda.min
coef(cv.fit)

# Predict risk score at cv.fit$lambda.min
predict(cv.fit,newX=X,type="lp")




