library(mpcv)


### Name: plot.mpcv
### Title: Plots an mpcv object.
### Aliases: plot.mpcv
### Keywords: multivariate

### ** Examples

data(industrial)   
x <- industrial$x
LSL <- industrial$LSL
USL <- industrial$USL
Target<- industrial$Target
res.ind <- mpcv(x, LSL=LSL, USL=USL, Target=Target, alpha=0.025, coef.lo=c(NA,.005))
plot(res.ind)



