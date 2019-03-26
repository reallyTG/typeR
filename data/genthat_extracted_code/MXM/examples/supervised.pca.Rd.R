library(MXM)


### Name: Supervised PCA
### Title: Supervised PCA
### Aliases: supervised.pca
### Keywords: Area under the curve receiver operating curve

### ** Examples

x <- as.matrix(iris[, 1:4])
target <- iris[, 5]
supervised.pca(target, x, indices = 1:2)



