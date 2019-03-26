library(rospca)


### Name: robpca
### Title: ROBust PCA algorithm
### Aliases: robpca
### Keywords: robust multivariate

### ** Examples

X <- dataGen(m=1, n=100, p=10, eps=0.2, bLength=4)$data[[1]]

resR <- robpca(X, k=2)
diagPlot(resR)



