library(flexclust)


### Name: bclust
### Title: Bagged Clustering
### Aliases: bclust plot,bclust,missing-method
###   clusters,bclust,missing-method parameters,bclust-method
### Keywords: multivariate cluster

### ** Examples

data(iris)
bc1 <- bclust(iris[,1:4], 3, base.k=5)
plot(bc1)

table(clusters(bc1, k=3))
parameters(bc1, k=3)



