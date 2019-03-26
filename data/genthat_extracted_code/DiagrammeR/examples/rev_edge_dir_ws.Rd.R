library(DiagrammeR)


### Name: rev_edge_dir_ws
### Title: Reverse the direction of selected edges in a graph
### Aliases: rev_edge_dir_ws

### ** Examples

# Create a graph with a
# directed tree
graph <-
  create_graph() %>%
  add_balanced_tree(
    k = 2, h = 2)

# Inspect the graph's edges
graph %>%
  get_edges()

# Select all edges associated
# with nodes `1` and `2`
graph <-
  graph %>%
  select_edges_by_node_id(
    nodes = 1:2)

# Reverse the edge directions
# of the edges associated with
# nodes `1` and `2`
graph <-
  graph %>%
  rev_edge_dir_ws()

# Inspect the graph's edges
# after their reversal
graph %>%
  get_edges()



