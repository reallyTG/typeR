## ----setup, include=FALSE------------------------------------------------
# knitr::opts_chunk$set(echo = TRUE)
library(iilasso)
library(MASS)

## ------------------------------------------------------------------------
# setting
set.seed(0)
X <- matrix(rnorm(200, mean=0, sd=1), nrow=20, ncol=10)
b <- matrix(c(1,0,-1,0,0,0,0,0,0,0), ncol=1)
y <- as.numeric(X %*% b + rnorm(10, mean=0, sd=0.1))

## ------------------------------------------------------------------------
cv_fit <- cv_lasso(X, y, delta=0.1, seed=0)
fit <- cv_fit$fit
fit$beta[, cv_fit$lambda.min.index]
fit$beta[, cv_fit$lambda.1se.index]
plot_cv_lasso(cv_fit)
plot_lasso(fit)

## ------------------------------------------------------------------------
pr <- predict_lasso(fit, X, cv_fit$lambda.min)
plot(pr, y)

