library(DiagrammeR)


### Name: delete_nodes_ws
### Title: Delete all selected nodes in a node selection
### Aliases: delete_nodes_ws

### ** Examples

# Create a graph with 3 nodes
graph <-
  create_graph() %>%
  add_n_nodes(n = 3) %>%
  add_edges_w_string(
    edges = "1->3 1->2 2->3")

# Select node with ID `1`
graph <-
  graph %>%
  select_nodes_by_id(nodes = 1)

# Delete node in selection (this
# also deletes any attached edges)
graph <-
  graph %>%
  delete_nodes_ws()

# Get a count of nodes in the graph
graph %>%
  count_nodes()



