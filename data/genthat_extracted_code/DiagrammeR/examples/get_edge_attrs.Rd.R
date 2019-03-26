library(DiagrammeR)


### Name: get_edge_attrs
### Title: Get edge attribute values
### Aliases: get_edge_attrs

### ** Examples

# Create a simple graph where
# edges have an edge attribute
# named `value`
graph <-
  create_graph() %>%
  add_n_nodes(n = 4) %>%
  {
    edges <-
      create_edge_df(
        from = c(1, 2, 1, 4),
          to = c(2, 3, 4, 3),
         rel = "rel")
    add_edge_df(
      graph = .,
      edge_df = edges)
  } %>%
  set_edge_attrs(
    edge_attr = value,
    values = 1.6,
    from = 1,
      to = 2) %>%
  set_edge_attrs(
    edge_attr = value,
    values = 4.3,
    from = 1,
      to = 4) %>%
  set_edge_attrs(
    edge_attr = value,
    values = 2.9,
    from = 2,
      to = 3) %>%
  set_edge_attrs(
    edge_attr = value,
    values = 8.4,
    from = 4,
      to = 3)

# Get the values for the
# `value` edge attribute
graph %>%
  get_edge_attrs(
    edge_attr = value)

# To only return edge attribute
# values for specified edges, use
# the `from` and `to` arguments
graph %>%
  get_edge_attrs(
    edge_attr = value,
    from = c(1, 2),
      to = c(2, 3))



