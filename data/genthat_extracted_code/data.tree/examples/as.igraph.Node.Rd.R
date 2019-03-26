library(data.tree)


### Name: as.igraph.Node
### Title: Convert a 'data.tree' structure to an igraph network
### Aliases: as.igraph.Node

### ** Examples

data(acme)
library(igraph)
ig <- as.igraph(acme, "p", c("level", "isLeaf"))
plot(ig)




