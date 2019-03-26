library(glmpath)


### Name: coxpath
### Title: Fits the entire L1 regularization path for Cox proportional
###   hazards model
### Aliases: coxpath
### Keywords: models regression

### ** Examples

data(lung.data)
attach(lung.data)
fit.a <- coxpath(lung.data)
fit.b <- coxpath(lung.data, method="efron")
detach(lung.data)



