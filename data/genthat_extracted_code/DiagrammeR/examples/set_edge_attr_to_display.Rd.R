library(DiagrammeR)


### Name: set_edge_attr_to_display
### Title: Set the edge attribute values to be rendered
### Aliases: set_edge_attr_to_display

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 4,
    m = 4,
    set_seed = 23) %>%
  set_edge_attrs(
    edge_attr = value,
    values = c(2.5, 8.2, 4.2, 2.4))

# For edge ID values of `1`,
# `2`, and `3`, choose to display
# the edge `value` attribute (for
# the other edges, display nothing)
graph <-
  graph %>%
  set_edge_attr_to_display(
    edges = 1:3,
    attr = value,
    default = NA)

# Show the graph's edge data frame; the
# `display` edge attribute will show, for
# each row, which edge attribute value to
# display when the graph is rendered
graph %>%
  get_edge_df()

# This function can be called multiple
# times on a graph; after the first time
# (i.e., creation of the `display`
# attribute), the `default` value won't
# be used
graph %>%
  set_edge_attr_to_display(
    edges = 4,
    attr = to) %>%
  set_edge_attr_to_display(
    edges = c(1, 3),
    attr = id) %>%
  get_edge_df()



