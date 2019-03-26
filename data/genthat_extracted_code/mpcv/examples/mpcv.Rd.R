library(mpcv)


### Name: mpcv
### Title: Multivariate process capability vector
### Aliases: mpcv
### Keywords: multivariate models

### ** Examples

data(industrial)   
x <- industrial$x
LSL <- industrial$LSL
USL <- industrial$USL
Target<- industrial$Target
res.ind <- mpcv(x, LSL=LSL, USL=USL, Target=Target, alpha=0.025)

data(automotive)
x <- automotive$x
LSL <- automotive$LSL
USL <- automotive$USL
Target<- automotive$Target
res.aut <- mpcv(x, indepvar="T",  LSL=LSL, USL=USL, Target=Target)

data(sleeves)
x <- sleeves$x
LSL <- sleeves$LSL
USL <- sleeves$USL
Target<- sleeves$Target
res.sle <- mpcv(x, indepvar=3, LSL=LSL, USL=USL, Target=Target, alpha=.02)



