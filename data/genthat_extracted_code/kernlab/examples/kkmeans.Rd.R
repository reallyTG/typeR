library(kernlab)


### Name: kkmeans
### Title: Kernel k-means
### Aliases: kkmeans kkmeans,matrix-method kkmeans,formula-method
###   kkmeans,list-method kkmeans,kernelMatrix-method
### Keywords: cluster

### ** Examples

## Cluster the iris data set.
data(iris)

sc <- kkmeans(as.matrix(iris[,-5]), centers=3)

sc
centers(sc)
size(sc)
withinss(sc)





