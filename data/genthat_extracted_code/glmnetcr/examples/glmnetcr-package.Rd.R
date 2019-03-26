library(glmnetcr)


### Name: glmnetcr-package
### Title: Penalized Constrained Continuation Ratio Models for Ordinal
###   Response Prediction using glmnet
### Aliases: glmnetcr-package
### Keywords: package models classif

### ** Examples

data(diabetes)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
glmnet.fit <- glmnetcr(x, y)
AIC <- select.glmnetcr(glmnet.fit, which="AIC")
fitted(glmnet.fit, s=AIC)



