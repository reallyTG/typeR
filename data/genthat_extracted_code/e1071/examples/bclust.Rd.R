library(e1071)


### Name: bclust
### Title: Bagged Clustering
### Aliases: bclust hclust.bclust plot.bclust centers.bclust
###   clusters.bclust
### Keywords: multivariate cluster

### ** Examples

data(iris)
bc1 <- bclust(iris[,1:4], 3, base.centers=5)
plot(bc1)

table(clusters.bclust(bc1, 3))
centers.bclust(bc1, 3)



