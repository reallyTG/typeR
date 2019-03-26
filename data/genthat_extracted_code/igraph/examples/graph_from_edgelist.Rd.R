library(igraph)


### Name: graph_from_edgelist
### Title: Create a graph from an edge list matrix
### Aliases: graph_from_edgelist graph.edgelist from_edgelist

### ** Examples

el <- matrix( c("foo", "bar", "bar", "foobar"), nc = 2, byrow = TRUE)
graph_from_edgelist(el)

# Create a ring by hand
graph_from_edgelist(cbind(1:10, c(2:10, 1)))



