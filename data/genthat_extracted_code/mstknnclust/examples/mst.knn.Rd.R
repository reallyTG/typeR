library(mstknnclust)


### Name: mst.knn
### Title: Performs the MST-kNN clustering algorithm
### Aliases: mst.knn

### ** Examples


set.seed(1987)

##load package
library("mstknnclust")

##Generates a data matrix of dimension 100X15

n=100; m=15
x <- matrix(runif(n*m, min = -5, max = 10), nrow=n, ncol=m)

##Computes a distance matrix of x.

library("amap")
d <- base::as.matrix(amap::Dist(x, method="euclidean"))

##Performs MST-kNN clustering using euclidean distance

results <- mst.knn(d)

## Visualizes the clustering solution

library("igraph")
plot(results$network, vertex.size=8,
     vertex.color=igraph::clusters(results$network)$membership,
     layout=igraph::layout.fruchterman.reingold(results$network, niter=10000),
     main=paste("MST-kNN \n Clustering solution \n k=",results$k,sep="" ))



