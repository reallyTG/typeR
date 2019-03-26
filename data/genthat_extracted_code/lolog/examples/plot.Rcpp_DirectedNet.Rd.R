library(lolog)


### Name: plot.Rcpp_DirectedNet
### Title: plot an DirectedNet object
### Aliases: plot.Rcpp_DirectedNet

### ** Examples

data(ukFaculty)
net <- as.BinaryNet(ukFaculty)
plot(net, vertex.col=net[["Group"]]+1)



