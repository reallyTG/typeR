library(glmpath)


### Name: cv.coxpath
### Title: Computes cross-validated (minus) log-partial-likelihoods for
###   coxpath
### Aliases: cv.coxpath
### Keywords: models regression

### ** Examples

data(lung.data)
attach(lung.data)
cv <- cv.coxpath(lung.data)
detach(lung.data)



