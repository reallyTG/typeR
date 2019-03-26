library(MNM)


### Name: summary.mvPCA
### Title: Summary for an object of class mvPCA.
### Aliases: summary.mvPCA print.summary.mvPCA
### Keywords: print methods

### ** Examples

data(iris)
IRIS <- iris[,1:4]
iris.pca <- mvPCA(IRIS, "sign", "i")
summary(iris.pca, loadings = TRUE)



