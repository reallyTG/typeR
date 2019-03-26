library(DiagrammeR)


### Name: count_nodes
### Title: Get a count of all nodes
### Aliases: count_nodes

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



