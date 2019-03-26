library(nat)


### Name: ngraph
### Title: ngraph: a graph to encode a neuron's connectivity
### Aliases: ngraph as.ngraph as.ngraph.data.frame as.ngraph.neuron

### ** Examples

g=as.ngraph(Cell07PNs[[1]])
library(igraph)
# check that vertex attributes of graph match X position
all.equal(V(g)$X, Cell07PNs[[1]]$d$X)



