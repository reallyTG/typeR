library(mvabund)


### Name: ridgeParamEst
### Title: Estimation of the ridge parameter
### Aliases: ridgeParamEst
### Keywords: models

### ** Examples

data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x

ridgeParamEst(dat = spiddat, X = model.matrix(spiddat~X))



