library(DiagrammeR)


### Name: set_node_attr_to_display
### Title: Set the node attribute values to be rendered
### Aliases: set_node_attr_to_display

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 4,
    m = 4,
    set_seed = 23) %>%
  set_node_attrs(
    node_attr = value,
    values = c(2.5, 8.2, 4.2, 2.4))

# For node ID values of `1`,
# `2`, and `3`, choose to display
# the node `value` attribute (for
# the other nodes, display nothing)
graph <-
  graph %>%
  set_node_attr_to_display(
    nodes = 1:3,
    attr = value,
    default = NA)

# Show the graph's node data frame; the
# `display` node attribute will show for
# each row, which node attribute value to
# display when the graph is rendered
graph %>%
  get_node_df()

# This function can be called multiple
# times on a graph; after the first time
# (i.e., creation of the `display`
# attribute), the `default` value won't
# be used
graph %>%
  set_node_attr_to_display(
    nodes = 4,
    attr = label) %>%
  set_node_attr_to_display(
    nodes = c(1, 3),
    attr = id) %>%
  get_node_df()



