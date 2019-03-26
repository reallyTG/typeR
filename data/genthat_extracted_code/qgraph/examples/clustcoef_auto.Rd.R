library(qgraph)


### Name: clustcoef_auto
### Title: Local clustering coefficients.
### Aliases: clustcoef_auto clustWS clustZhang clustOnnela
### Keywords: signed weighted clustering

### ** Examples

set.seed(1)
# generate a random (directed) network:
net_ig <- igraph::erdos.renyi.game(n=8, p.or.m=.4, type="gnp", directed=TRUE) 

# convert it to an adjacency matrix:
net <- as.matrix(igraph:::get.adjacency(net_ig, type="both")) 

# convert it to a signed and weighted network:
net <- net*matrix(rnorm(ncol(net)^2), ncol=ncol(net)) 

# make it undirected:
net[upper.tri(net)] <- t(net)[upper.tri(net)] 
clustcoef_auto(net)



