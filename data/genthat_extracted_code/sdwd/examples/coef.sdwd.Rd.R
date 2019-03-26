library(sdwd)


### Name: coef.sdwd
### Title: compute coefficients for the sparse DWD
### Aliases: coef.sdwd
### Keywords: models regression

### ** Examples

data(colon)
fit = sdwd(colon$x, colon$y, lambda2=1)
c1 = coef(fit, type="coef",s=c(0.1, 0.005))
c2 = coef(fit, type="nonzero")



