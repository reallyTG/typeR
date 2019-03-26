library(igraph)


### Name: all_simple_paths
### Title: List all simple paths from one source
### Aliases: all_simple_paths
### Keywords: graphs

### ** Examples


g <- make_ring(10)
all_simple_paths(g, 1, 5)
all_simple_paths(g, 1, c(3,5))




