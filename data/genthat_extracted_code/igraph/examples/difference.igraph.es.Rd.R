library(igraph)


### Name: difference.igraph.es
### Title: Difference of edge sequences
### Aliases: difference.igraph.es

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
difference(V(g), V(g)[6:10])



