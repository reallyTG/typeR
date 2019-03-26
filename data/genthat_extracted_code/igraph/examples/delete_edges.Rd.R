library(igraph)


### Name: delete_edges
### Title: Delete edges from a graph
### Aliases: delete_edges delete.edges

### ** Examples

g <- make_ring(10) %>%
  delete_edges(seq(1, 9, by = 2))
g

g <- make_ring(10) %>%
  delete_edges("10|1")
g



