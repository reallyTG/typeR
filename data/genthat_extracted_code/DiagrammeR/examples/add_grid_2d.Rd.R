library(DiagrammeR)


### Name: add_grid_2d
### Title: Add a 2D grid of nodes to the graph
### Aliases: add_grid_2d

### ** Examples

# Create a new graph and add
# a 3 x 3 grid
graph <-
  create_graph() %>%
  add_grid_2d(
    x = 3, y = 3,
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
  add_grid_2d(
    x = 3, y = 2,
    label = c("one", "two",
              "three", "four",
              "five", "six"),
    type = c("a", "a",
             "b", "b",
             "c", "c"),
    rel = "grid",
    node_data = node_data(
      value = c(
        1.2, 8.4, 3.4,
        5.2, 6.1, 2.6)))

# Get the graph's node data frame
graph_w_attrs %>%
  get_node_df()

# Get the graph's edge data frame
graph_w_attrs %>%
  get_edge_df()



