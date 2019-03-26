library(DiagrammeR)


### Name: fully_disconnect_nodes_ws
### Title: Fully disconnect all nodes in a selection of nodes
### Aliases: fully_disconnect_nodes_ws

### ** Examples

# Create an empty graph and
# add a path of 6 nodes
graph <-
  create_graph() %>%
  add_path(n = 6)

# Select nodes `3` and `4`
# and fully disconnect them
# from the graph
graph <-
  graph %>%
  select_nodes_by_id(
    nodes = 3:4) %>%
  fully_disconnect_nodes_ws()

# Get the graph's edge data frame
graph %>%
  get_edge_df()



