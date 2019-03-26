library(DiagrammeR)


### Name: colorize_edge_attrs
### Title: Apply colors based on edge attribute values
### Aliases: colorize_edge_attrs

### ** Examples

# Create a graph with 5
# nodes and 4 edges
graph <-
  create_graph() %>%
  add_path(n = 5) %>%
  set_edge_attrs(
    edge_attr = weight,
    values = c(3.7, 6.3, 9.2, 1.6))

# We can bucketize values in
# the edge `weight` attribute using
# `cut_points` and, by doing so,
# assign colors to each of the
# bucketed ranges (for values not
# part of any bucket, a gray color
# is assigned by default)
graph <-
  graph %>%
  colorize_edge_attrs(
    edge_attr_from = weight,
    edge_attr_to = color,
    cut_points = c(0, 2, 4, 6, 8, 10),
    palette = "RdYlGn")

# Now there will be a `color`
# edge attribute with distinct
# colors (from the RColorBrewer
# Red-Yellow-Green palette)
graph %>%
  get_edge_df()



