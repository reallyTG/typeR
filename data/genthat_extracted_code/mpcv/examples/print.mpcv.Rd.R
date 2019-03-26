library(mpcv)


### Name: print
### Title: Prints an mpcv object
### Aliases: print.mpcv
### Keywords: multivariate

### ** Examples

data(industrial)   
x <- industrial$x
LSL <- industrial$LSL
USL <- industrial$USL
Target<- industrial$Target
res.ind <- mpcv(x, LSL=LSL, USL=USL, Target=Target, alpha=0.025)
print(res.ind)



