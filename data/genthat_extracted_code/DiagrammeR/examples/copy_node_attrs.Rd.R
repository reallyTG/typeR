library(DiagrammeR)


### Name: copy_node_attrs
### Title: Copy a node attribute column and set the name
### Aliases: copy_node_attrs

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 5,
    m = 10,
    set_seed = 23) %>%
  set_node_attrs(
    node_attr = shape,
    values = "circle") %>%
  set_node_attrs(
    node_attr = value,
    values = rnorm(
      n = count_nodes(.),
      mean = 5,
      sd = 1) %>% round(1))

# Get the graph's internal
# ndf to show which node
# attributes are available
graph %>%
  get_node_df()

# Make a copy the `value`
# node attribute as the
# `width` node attribute
graph <-
  graph %>%
  copy_node_attrs(
    node_attr_from = value,
    node_attr_to = size)

# Get the graph's internal
# ndf to show that the node
# attribute had been copied
graph %>%
  get_node_df()



