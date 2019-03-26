library(lolog)


### Name: as.network.Rcpp_DirectedNet
### Title: Convert a DirectedNet to a network object
### Aliases: as.network.Rcpp_DirectedNet

### ** Examples

el <- matrix(c(1,2),ncol=2)

#make an UndirectedNet with one edge and 5 nodes
net <- new(UndirectedNet, el, 5L)

nw <- as.network(net)
nw



