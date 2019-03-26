library(MultiVarSel)


### Name: whitening
### Title: This function provides an estimation of the inverse of the
###   square root of the covariance matrix of each row of the residuals
###   matrix.
### Aliases: whitening

### ** Examples

data(copals_camera)
Y=scale(Y[,1:100])
X <- model.matrix( ~ group + 0)
residuals=lm(as.matrix(Y)~X-1)$residuals
whitening(residuals, "AR1")



