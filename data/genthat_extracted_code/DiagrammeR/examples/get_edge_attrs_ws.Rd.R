library(DiagrammeR)


### Name: get_edge_attrs_ws
### Title: Get edge attribute values
### Aliases: get_edge_attrs_ws

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

# Select the edges defined as
# `1`->`3` and `2`->`3`
graph <-
  graph %>%
  select_edges(
    from = c(1, 2),
    to = c(2, 3))

# Get the edge attribute values
# for the `value` attribute, limited
# to the current edge selection
graph %>%
  get_edge_attrs_ws(
    edge_attr = value)



