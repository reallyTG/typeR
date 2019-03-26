library(DiagrammeR)


### Name: add_grid_3d
### Title: Add a 3D grid of nodes to the graph
### Aliases: add_grid_3d

### ** Examples

# Create a new graph and add
# a 2 x 2 x 2 grid
graph <-
  create_graph() %>%
  add_grid_3d(
    x = 2, y = 2, z = 2,
    type = "grid")

# Get node information
# from this graph
graph %>%
  get_node_info()

# Attributes can be specified
# in extra arguments and these
# are applied in order; Usually
# these attributes are applied
# to nodes (e.g., `type` is a
# node attribute) but the `rel`
# attribute will apply to the
# edges
graph_w_attrs <-
  create_graph() %>%
  add_grid_3d(
    x = 2, y = 2, z = 2,
    label = c(
      "one", "two", "three",
      "four", "five", "six",
      "seven", "eight"),
    type = c(
      "a", "a", "b",
      "b", "c", "c",
      "d", "d"),
    rel = "grid",
    node_data = node_data(
      value = c(
        1.2, 8.4, 3.4,
        5.2, 6.1, 2.6,
        6.3, 9.3)))

# Get the graph's node data frame
graph_w_attrs %>%
  get_node_df()

# Get the graph's edge data frame
graph_w_attrs %>%
  get_edge_df()



