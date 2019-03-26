library(mstknnclust)


### Name: generate.complete.graph
### Title: Generates a complete graph
### Aliases: generate.complete.graph
### Keywords: complete graph

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

head(cg)

##Visualizing CG graph
library("igraph")
cg.network=igraph::graph.adjacency(d, mode="undirected", weighted=TRUE)
plot(cg.network, edge.label=round(E(cg.network)$weight, 2), main="Complete Graph")




