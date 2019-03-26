library(DiagrammeR)


### Name: rescale_edge_attrs
### Title: Rescale numeric edge attribute values
### Aliases: rescale_edge_attrs

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 7,
    set_seed = 23) %>%
  set_edge_attrs(
    edge_attr = weight,
    values = rnorm(
      n = count_edges(.),
      mean = 5,
      sd = 1))

# Get the graph's internal edf
# to show which edge attributes
# are available
graph %>%
  get_edge_df()

# Rescale the `weight` edge
# attribute, so that its values
# are rescaled between 0 and 1
graph <-
  graph %>%
  rescale_edge_attrs(
    edge_attr_from = weight,
    to_lower_bound = 0,
    to_upper_bound = 1)

# Get the graph's internal edf
# to show that the edge attribute
# values had been rescaled
graph %>%
  get_edge_df()

# Scale the values in the `weight`
# edge attribute to different
# shades of gray for the `color`
# edge attribute and different
# numerical values for the
# `penwidth` attribute
graph <-
  graph %>%
  rescale_edge_attrs(
    edge_attr_from = weight,
    to_lower_bound = "gray80",
    to_upper_bound = "gray20",
    edge_attr_to = color) %>%
  rescale_edge_attrs(
    edge_attr_from = weight,
    to_lower_bound = 0.5,
    to_upper_bound = 3,
    edge_attr_to = penwidth)

# Get the graph's internal edf
# once more to show that scaled
# grayscale colors are now available
# in `color` and scaled numerical
# values are in the `penwidth`
# edge attribute
graph %>%
  get_edge_df()



