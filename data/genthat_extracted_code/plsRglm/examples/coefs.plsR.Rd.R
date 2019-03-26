library(plsRglm)


### Name: coefs.plsR
### Title: Coefficients for bootstrap computations of PLSR models
### Aliases: coefs.plsR
### Keywords: models

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]

# Lazraq-Cleroux PLS (Y,X) bootstrap
# statistic=coefs.plsR is the default for (Y,X) resampling of PLSR models.
set.seed(250)
modpls <- plsR(yCornell,XCornell,1)
Cornell.bootYX <- bootpls(modpls, R=250, statistic=coefs.plsR)



