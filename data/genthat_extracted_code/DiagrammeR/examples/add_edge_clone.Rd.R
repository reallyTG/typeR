library(DiagrammeR)


### Name: add_edge_clone
### Title: Add a clone of an existing edge to the graph
### Aliases: add_edge_clone

### ** Examples

# Create a graph with a path of
# 2 nodes; supply a common `rel`
# edge attribute for all edges
# in this path and then add a
# `color` edge attribute
graph <-
  create_graph() %>%
  add_path(
    n = 2,
    rel = "a") %>%
  select_last_edges_created() %>%
  set_edge_attrs(
    edge_attr = color,
    values = "steelblue") %>%
  clear_selection()

# Display the graph's internal
# edge data frame
graph %>%
  get_edge_df()

# Create a new node (will have
# node ID of `3`) and then
# create an edge between it and
# node `1` while reusing the edge
# attributes of edge `1` -> `2`
# (edge ID `1`)
graph_2 <-
  graph %>%
  add_node() %>%
  add_edge_clone(
    edge = 1,
    from = 3,
      to = 1)

# Display the graph's internal
# edge data frame
graph_2 %>%
  get_edge_df()

# The same change can be performed
# with some helper functions in the
# `add_edge_clone()` function call
graph_3 <-
  graph %>%
    add_node() %>%
    add_edge_clone(
      edge = get_last_edges_created(.),
      from = get_last_nodes_created(.),
      to = 1)

# Display the graph's internal
# edge data frame
graph_3 %>%
  get_edge_df()



