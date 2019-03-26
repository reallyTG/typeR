library(DiagrammeR)


### Name: get_node_attrs_ws
### Title: Get node attribute values from a selection of nodes
### Aliases: get_node_attrs_ws

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

# Select nodes with ID values
# `1` and `3`
graph <-
  graph %>%
  select_nodes_by_id(
    nodes = c(1, 3))

# Get the node attribute values
# for the `value` attribute, limited
# to the current node selection
graph %>%
  get_node_attrs_ws(
    node_attr = value)



