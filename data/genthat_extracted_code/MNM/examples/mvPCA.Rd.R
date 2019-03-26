library(MNM)


### Name: mvPCA
### Title: Principal Component Analysis
### Aliases: mvPCA
### Keywords: multivariate nonparametric

### ** Examples

data(iris)
IRIS <- iris[,1:4]
iris.pca <- mvPCA(IRIS, "sign", "i")
iris.pca
summary(iris.pca)
pairs(iris.pca$scores, col=iris[,5])



