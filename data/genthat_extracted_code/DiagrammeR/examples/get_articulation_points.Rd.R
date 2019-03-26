library(DiagrammeR)


### Name: get_articulation_points
### Title: Get articulation points
### Aliases: get_articulation_points

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 12,
    set_seed = 23) %>%
  set_node_attrs(
    node_attr = shape,
    values = "square")

# Get the articulation points
# in the graph (i.e., those
# nodes that if any were to be
# removed, the graph would
# become disconnected)
graph %>%
  get_articulation_points()

# For the articulation points,
# change the node shape to
# a `circle`
graph <-
  graph %>%
  select_nodes_by_id(
    nodes = get_articulation_points(.)) %>%
  set_node_attrs_ws(
    node_attr = shape,
    value = "circle")



