library(igraph)


### Name: min_cut
### Title: Minimum cut in a graph
### Aliases: min_cut graph.mincut

### ** Examples

g <- make_ring(100)
min_cut(g, capacity=rep(1,vcount(g)))
min_cut(g, value.only=FALSE, capacity=rep(1,vcount(g)))

g2 <- graph( c(1,2,2,3,3,4, 1,6,6,5,5,4, 4,1) )
E(g2)$capacity <- c(3,1,2, 10,1,3, 2)
min_cut(g2, value.only=FALSE)



