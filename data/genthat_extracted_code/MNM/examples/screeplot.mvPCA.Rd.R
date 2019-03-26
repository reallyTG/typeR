library(MNM)


### Name: screeplot.mvPCA
### Title: Plotting Method for a Principal Component Object of Type mvPCA
### Aliases: plot.mvPCA screeplot.mvPCA
### Keywords: hplot methods

### ** Examples

data(IRIS)
IRIS <- iris[,1:4]
iris.pca <- mvPCA(IRIS, "sign", "i")
plot(iris.pca, type="lines")



