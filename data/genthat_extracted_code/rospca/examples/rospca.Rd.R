library(rospca)


### Name: rospca
### Title: RObust Sparse PCA algorithm
### Aliases: rospca
### Keywords: robust multivariate

### ** Examples

X <- dataGen(m=1, n=100, p=10, eps=0.2, bLength=4)$data[[1]]

resRS <- rospca(X, k=2, lambda=0.4, stand=TRUE)
diagPlot(resRS)



