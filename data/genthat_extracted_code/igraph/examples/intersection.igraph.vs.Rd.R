library(igraph)


### Name: intersection.igraph.vs
### Title: Intersection of vertex sequences
### Aliases: intersection.igraph.vs

### ** Examples

g <- make_(ring(10), with_vertex_(name = LETTERS[1:10]))
intersection(E(g)[1:6], E(g)[5:9])



