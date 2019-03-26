library(statGraph)


### Name: graph.entropy
### Title: Graph spectral entropy
### Aliases: graph.entropy
### Keywords: spectral_entropy

### ** Examples

require(igraph)
G <- erdos.renyi.game(100, p=0.5)
A <- as.matrix(get.adjacency(G))
entropy <- graph.entropy(A)
entropy




