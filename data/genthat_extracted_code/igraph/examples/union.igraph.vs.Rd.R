library(igraph)


### Name: union.igraph.vs
### Title: Union of vertex sequences
### Aliases: union.igraph.vs

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
union(V(g)[1:6], V(g)[5:10])



