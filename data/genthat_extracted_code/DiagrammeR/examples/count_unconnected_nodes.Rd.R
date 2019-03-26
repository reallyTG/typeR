library(DiagrammeR)


### Name: count_unconnected_nodes
### Title: Get count of all unconnected nodes
### Aliases: count_unconnected_nodes

### ** Examples

# Create a graph with a
# path of nodes and 3
# unconnected nodes
graph <-
  create_graph() %>%
  add_path(n = 3) %>%
  add_n_nodes(n = 3)

# Get a count of all nodes
# in the graph
graph %>%
  count_nodes()

# Get a count of all
# unconnected nodes in the
# graph
graph %>%
  count_unconnected_nodes()



