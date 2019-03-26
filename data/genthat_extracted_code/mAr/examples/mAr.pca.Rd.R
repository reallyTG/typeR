library(mAr)


### Name: mAr.pca
### Title: Multivariate autoregressive analysis in PCA space
### Aliases: mAr.pca
### Keywords: multivariate

### ** Examples


data(sparrows)
A=mAr.est(sparrows,1)$AHat
mAr.eig(A)$modes
mAr.pca(sparrows,1,k=4)$modes




