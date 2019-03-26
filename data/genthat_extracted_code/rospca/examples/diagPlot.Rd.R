library(rospca)


### Name: diagPlot
### Title: Diagnostic plot for PCA
### Aliases: diagPlot
### Keywords: plot robust

### ** Examples

X <- dataGen(m=1, n=100, p=10, eps=0.2, bLength=4)$data[[1]]

resR <- robpca(X, k=2, skew=FALSE)
diagPlot(resR)



