library(DiagrammeR)


### Name: get_edge_df
### Title: Get an edge data frame from a graph
### Aliases: get_edge_df

### ** Examples

# Create a graph
graph <-
  create_graph() %>%
  add_n_nodes(
    n = 1,
    type = "a") %>%
  select_last_nodes_created() %>%
  add_n_nodes_ws(
    n = 5,
    direction = "from",
    type = "b") %>%
  select_edges_by_node_id(
    nodes = 3:5) %>%
  set_edge_attrs_ws(
    edge_attr = color,
    value = "green") %>%
  set_edge_attrs_ws(
    edge_attr = rel,
    value = "a") %>%
  invert_selection %>%
  set_edge_attrs_ws(
    edge_attr = color,
    value = "blue") %>%
  set_edge_attrs_ws(
    edge_attr = rel,
    value = "b") %>%
  clear_selection()

# Get the graph's internal
# edge data frame (edf)
graph %>%
  get_edge_df()



