library(igraph)


### Name: difference.igraph.vs
### Title: Difference of vertex sequences
### Aliases: difference.igraph.vs

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
difference(V(g), V(g)[6:10])



