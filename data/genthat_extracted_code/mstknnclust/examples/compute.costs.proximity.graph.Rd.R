library(mstknnclust)


### Name: compute.costs.proximity.graph
### Title: Computes the edge costs sum of a proximity graph
### Aliases: compute.costs.proximity.graph

### ** Examples


set.seed(1987)

##Generates a data matrix of dimension 50X13
n=50; m=13
x <- matrix(runif(n*m, min = -5, max = 10), nrow=n, ncol=m)

##Computes a distance matrix of x.

library("amap")
d <- base::as.matrix(amap::Dist(x, method="euclidean"))

##Generates complete graph (CG)

cg <- generate.complete.graph(1:nrow(x),d)

##Generates a proximity graph (MST)
mstree <- generate.mst(cg)

##Calculate the edge cost sum of proximity graph (MST)
mstree.cost=as.numeric(compute.costs.proximity.graph(as.matrix(mstree$edges.mst.graph[,1:2]), d))
mstree.cost

##Generates a proximity graph (kNN)
knneig <- generate.knn(cg)

##Calculate the edge cost sum of proximity graph (kNN)
knneig.cost=as.numeric(compute.costs.proximity.graph(as.matrix(knneig$edges.knn.graph[,1:2]), d))
knneig.cost



