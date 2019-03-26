library(rospca)


### Name: dataGen
### Title: Generate sparse data with outliers
### Aliases: dataGen
### Keywords: datagen

### ** Examples

X <- dataGen(m=1, n=100, p=10, eps=0.2, bLength=4)$data[[1]]

resR <- robpca(X, k=2, skew=FALSE)
diagPlot(resR)



