library(DiagrammeR)


### Name: rename_edge_attrs
### Title: Rename an edge attribute
### Aliases: rename_edge_attrs

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 5,
    m = 8,
    set_seed = 23) %>%
  set_edge_attrs(
    edge_attr = color,
    values = "green")

# Get the graph's internal edf
# to show which edge attributes
# are available
graph %>%
  get_edge_df()

# Rename the `color` node
# attribute as `weight`
graph <-
  graph %>%
  rename_edge_attrs(
    edge_attr_from = color,
    edge_attr_to = labelfontcolor)

# Get the graph's internal
# edf to show that the edge
# attribute had been renamed
graph %>%
  get_edge_df()



