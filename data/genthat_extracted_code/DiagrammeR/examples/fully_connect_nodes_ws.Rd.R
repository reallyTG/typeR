library(DiagrammeR)


### Name: fully_connect_nodes_ws
### Title: Fully connect all nodes in a selection of nodes
### Aliases: fully_connect_nodes_ws

### ** Examples

# Create an empty graph and
# then add a path of 3 nodes
# and two isolated nodes
graph <-
  create_graph() %>%
  add_path(n = 3) %>%
  add_n_nodes(n = 2)

# Select a node in the path
# of nodes (node `3`) and
# the two isolated nodes (`4`
# and `5`); then, and fully
# connect these nodes together
graph <-
  graph %>%
  select_nodes_by_id(
    nodes = 3:5) %>%
  fully_connect_nodes_ws()

# Get the graph's edge data frame
graph %>%
  get_edge_df()

# Create an undirected, empty
# graph; add a path of 3 nodes
# and two isolated nodes
graph <-
  create_graph(
    directed = FALSE) %>%
  add_path(n = 3) %>%
  add_n_nodes(n = 2)

# Select a node in the path
# of nodes (node `3`) and
# the two isolated nodes (`4`
# and `5`); then, and fully
# connect these nodes together
graph <-
  graph %>%
  select_nodes_by_id(
    nodes = 3:5) %>%
  fully_connect_nodes_ws()

# Get the graph's edge data
# frame; in the undirected
# case, reverse edges aren't
# added
graph %>%
  get_edge_df()



