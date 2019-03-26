library(DiagrammeR)


### Name: get_node_attrs
### Title: Get node attribute values
### Aliases: get_node_attrs

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

# Get all of the values from
# the `value` node attribute
# as a named vector
graph %>%
  get_node_attrs(
    node_attr = value)

# To only return node attribute
# values for specified nodes,
# use the `nodes` argument
graph %>%
  get_node_attrs(
    node_attr = value,
    nodes = c(1, 3))



