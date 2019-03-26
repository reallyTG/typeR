library(glmnetcr)


### Name: glmnetcr
### Title: Fit a Penalized Constrained Continuation Ratio Model Using Lasso
###   or Elasticnet Regularization Via glmnet
### Aliases: glmnetcr
### Keywords: models classif

### ** Examples

data(diabetes)

x <- diabetes[, 2:dim(diabetes)[2]]

y <- diabetes$y

glmnet.fit <- glmnetcr(x, y)

fitted(glmnet.fit, s = select.glmnetcr(glmnet.fit))



