library(plsRglm)


### Name: permcoefs.plsR
### Title: Coefficients for permutation bootstrap computations of PLSR
###   models
### Aliases: permcoefs.plsR
### Keywords: models

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]

# Lazraq-Cleroux PLS (Y,X) bootstrap
# statistic=permcoefs.plsR is the default for (Y,X) permutation resampling of PLSR models.
set.seed(250)
modpls <- plsR(yCornell,XCornell,1)
Cornell.bootYX <- bootpls(modpls, sim="permutation", R=250, statistic=permcoefs.plsR)



