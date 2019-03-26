library(ahaz)


### Name: predict.ahazpen
### Title: Prediction methods for ahazpen
### Aliases: predict.ahazpen coef.ahazpen
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
fit <- ahazpen(surv, X, dfmax=100)

# Coefficients
beta <- predict(fit,X,lambda=0.08,type="coef")
barplot(as.numeric(beta))

# Linear predictions
linpred <- predict(fit,X,lambda=0.1,type="lp")
riskgrp <- factor(linpred < median(linpred))
plot(survfit(surv~riskgrp))

# Residuals
resid <- predict(fit, X, lambda=0.1, type = "residuals")
par(mfrow = c(1,2))
hist(resid[,1],main=colnames(resid)[1])
hist(resid[,2],main=colnames(resid)[2])

# Cumulative hazard
cumhaz <- predict(fit,X,lambda=0.1,type="cumhaz")
plot(cumhaz)





