library(igraph)


### Name: edge_density
### Title: Graph density
### Aliases: edge_density graph.density
### Keywords: graphs

### ** Examples


g1 <- make_empty_graph(n=10)
g2 <- make_full_graph(n=10)
g3 <- sample_gnp(n=10, 0.4)

# loop edges
g <- graph( c(1,2, 2,2, 2,3) )
edge_density(g, loops=FALSE)              # this is wrong!!!
edge_density(g, loops=TRUE)               # this is right!!!
edge_density(simplify(g), loops=FALSE)    # this is also right, but different




