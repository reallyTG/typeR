library(igraph)


### Name: c.igraph.vs
### Title: Concatenate vertex sequences
### Aliases: c.igraph.vs

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
c(V(g)[1], V(g)['A'], V(g)[1:4])



