library(lolog)


### Name: as.network.Rcpp_UndirectedNet
### Title: Convert a UndirectedNet to a network object
### Aliases: as.network.Rcpp_UndirectedNet

### ** Examples

el <- matrix(c(1,2),ncol=2)

#make an UndirectedNet with one edge and 5 nodes
net <- new(UndirectedNet, el, 5L)
net[1:5,1:5]

nw <- as.network(net)
nw



