library(igraph)


### Name: groups
### Title: Groups of a vertex partitioning
### Aliases: groups groups.default groups.communities

### ** Examples

g <- make_graph("Zachary")
fgc <- cluster_fast_greedy(g)
groups(fgc)

g2 <- make_ring(10) + make_full_graph(5)
groups(components(g2))



