library(DiagrammeR)


### Name: rescale_node_attrs
### Title: Rescale numeric node attribute values
### Aliases: rescale_node_attrs

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

# Rescale the `value` node
# attribute, so that its values
# are rescaled between 0 and 1
graph <-
  graph %>%
  rescale_node_attrs(
    node_attr_from = value,
    to_lower_bound = 0,
    to_upper_bound = 1)

# Get the graph's internal ndf
# to show that the node attribute
# values had been rescaled
graph %>%
  get_node_df()

# Scale the values in the `value`
# node attribute to different
# shades of gray for the `fillcolor`
# and `fontcolor` node attributes
graph <-
  graph %>%
  rescale_node_attrs(
    node_attr_from = value,
    to_lower_bound = "gray80",
    to_upper_bound = "gray20",
    node_attr_to = fillcolor) %>%
  rescale_node_attrs(
    node_attr_from = value,
    to_lower_bound = "gray5",
    to_upper_bound = "gray95",
    node_attr_to = fontcolor)

# Get the graph's internal ndf
# once more to show that scaled
# grayscale colors are now available
# in the `fillcolor` and `fontcolor`
# node attributes
graph %>%
  get_node_df()



