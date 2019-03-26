library(genie)


### Name: hclust2
### Title: Fast Hierarchical Clustering in Arbitrary Spaces Equipped With a
###   Dissimilarity Measure
### Aliases: hclust2

### ** Examples

library("datasets")
data("iris")
h <- hclust2(objects=as.matrix(iris[,2:3]), thresholdGini=0.2)
plot(iris[,2], iris[,3], col=cutree(h, 3), pch=as.integer(iris[,5]))




