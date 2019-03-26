library(DiagrammeR)


### Name: deselect_edges
### Title: Deselect any selected edges in a graph
### Aliases: deselect_edges

### ** Examples

# Create a graph with
# a single path
graph <-
  create_graph() %>%
  add_path(n = 5)

# Select edges with IDs `1`
# and `3`
graph <-
  graph %>%
  select_edges_by_edge_id(
    edges = c(1, 3))

# Verify that an edge selection
# has been made
graph %>%
  get_selection()

# Deselect edge `1`
graph <-
  graph %>%
  select_edges_by_edge_id(
    edges = c(1, 3)) %>%
  deselect_edges(edges = 1)

# Verify that the edge selection
# has been made for edges `1` and
# `3` and that edge `1` has been
# deselected (leaving only `3`)
graph %>%
  get_selection()



