library(igraph)


### Name: is_directed
### Title: Check whether a graph is directed
### Aliases: is_directed is.directed

### ** Examples

g <- make_ring(10)
is_directed(g)

g2 <- make_ring(10, directed = TRUE)
is_directed(g2)



