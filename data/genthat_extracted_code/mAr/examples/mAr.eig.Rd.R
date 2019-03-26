library(mAr)


### Name: mAr.eig
### Title: Eigendecomposition of m-variate AR(p) model
### Aliases: mAr.eig
### Keywords: multivariate

### ** Examples

data(pinkham)
y=mAr.est(pinkham,2,5)
mAr.eig(y$AHat,y$CHat)




