library(DiagrammeR)


### Name: delete_edges_ws
### Title: Delete all selected edges in an edge selection
### Aliases: delete_edges_ws

### ** Examples

# Create a graph
graph <-
  create_graph() %>%
  add_n_nodes(n = 3) %>%
  add_edges_w_string(
    edges = "1->3 1->2 2->3")

# Select edges attached to
# node with ID `3` (these are
# `1`->`3` and `2`->`3`)
graph <-
  graph %>%
  select_edges_by_node_id(nodes = 3)

# Delete edges in selection
graph <-
  graph %>%
  delete_edges_ws()

# Get a count of edges in the graph
graph %>%
  count_edges()



