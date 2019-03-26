library(mpcv)


### Name: coef.mpcv
### Title: Extracts leading coefficients of the one-sided models from the
###   mpcv object
### Aliases: coef.mpcv
### Keywords: multivariate

### ** Examples

data(industrial)   
x <- industrial$x
LSL <- industrial$LSL
USL <- industrial$USL
Target<- industrial$Target
res.ind <- mpcv(x, LSL=LSL, USL=USL, Target=Target, alpha=0.025)
coef(res.ind)



