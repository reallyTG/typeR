library(mstknnclust)


### Name: generate.mst
### Title: Generates a MST graph
### Aliases: generate.mst
### Keywords: graph mst

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

##Generates MST graph

mstree <- generate.mst(cg)

##Visualizing MST graph
plot(mstree$mst.graph, main="MST")





