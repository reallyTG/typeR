library(DiagrammeR)


### Name: is_edge_present
### Title: Determine whether a specified edge is present
### Aliases: is_edge_present

### ** Examples

# Create a simple graph with
# a path of four nodes
graph <-
  create_graph() %>%
  add_path(
    n = 4,
    type = "path",
    label = c("one", "two",
              "three", "four"))

# Find out if edge ID `3`
# is present in the graph
graph %>%
  is_edge_present(edge = 3)

# Determine if there are any edges
# with the definition `1` -> `2`
graph %>%
  is_edge_present(
    from = 1,
    to = 2)

# Determine if there are any edges
# with the definition `4` -> `5`
graph %>%
  is_edge_present(
    from = 4,
    to = 5)

# Determine whether an edge,
# defined by its labels as
# `two` -> `three`, exists in
# the graph
graph %>%
  is_edge_present(
    from = "two",
    to = "three")

# Set the graph as undirected
# and determine whether an
# edge between nodes with labels
# `three` and `two` exists
graph %>%
  set_graph_undirected() %>%
  is_edge_present(
    from = "three",
    to = "two")



