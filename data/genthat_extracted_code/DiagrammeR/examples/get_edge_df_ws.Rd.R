library(DiagrammeR)


### Name: get_edge_df_ws
### Title: Get the graph's edf filtered by a selection of edges
### Aliases: get_edge_df_ws

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 4,
    m = 4,
    set_seed = 23) %>%
  set_edge_attrs(
    edge_attr = value,
    values = c(2.5, 8.2, 4.2, 2.4))

# Select edges with ID values
# `1` and `3`
graph <-
  graph %>%
  select_edges_by_edge_id(
    edges = c(1, 3))

# Get the edge data frame that's
# limited to the rows that correspond
# to the edge selection
graph %>%
  get_edge_df_ws()



