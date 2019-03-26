library(DiagrammeR)


### Name: rename_node_attrs
### Title: Rename a node attribute
### Aliases: rename_node_attrs

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 5,
    m = 8,
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

# Get the graph's internal ndf
# to show which node attributes
# are available
graph %>%
  get_node_df()

# Rename the `value` node
# attribute as `weight`
graph <-
  graph %>%
  rename_node_attrs(
    node_attr_from = value,
    node_attr_to = weight)

# Get the graph's internal
# ndf to show that the node
# attribute had been renamed
graph %>%
  get_node_df()



