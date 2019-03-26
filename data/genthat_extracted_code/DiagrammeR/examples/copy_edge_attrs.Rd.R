library(DiagrammeR)


### Name: copy_edge_attrs
### Title: Copy an edge attribute column and set the name
### Aliases: copy_edge_attrs

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

# Get the graph's internal
# edf to show which edge
# attributes are available
graph %>%
  get_edge_df()

# Make a copy the `color`
# edge attribute as the
# `color_2` edge attribute
graph <-
  graph %>%
  copy_edge_attrs(
    edge_attr_from = color,
    edge_attr_to = color_2)

# Get the graph's internal
# edf to show that the edge
# attribute had been copied
graph %>%
  get_edge_df()



