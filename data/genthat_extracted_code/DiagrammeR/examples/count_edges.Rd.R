library(DiagrammeR)


### Name: count_edges
### Title: Get a count of all edges
### Aliases: count_edges

### ** Examples

# Create a graph with a
# path of nodes and 3
# unconnected nodes
graph <-
  create_graph() %>%
  add_path(n = 3) %>%
  add_n_nodes(n = 3)

# Get a count of all edges
# in the graph
graph %>%
  count_edges()



