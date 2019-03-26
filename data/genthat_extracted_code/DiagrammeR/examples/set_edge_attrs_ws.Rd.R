library(DiagrammeR)


### Name: set_edge_attrs_ws
### Title: Set edge attributes with an edge selection
### Aliases: set_edge_attrs_ws

### ** Examples

# Create a simple graph
graph <-
  create_graph() %>%
  add_path(n = 6)

# Select specific edges from
# the graph and apply the edge
# attribute `color = blue` to
# those selected edges
graph <-
  graph %>%
  select_nodes_by_id(nodes = 2:4) %>%
  trav_out_edge() %>%
  set_edge_attrs_ws(
    edge_attr = color,
    value = "blue")

# Show the internal edge data
# frame to verify that the
# edge attribute has been set
# for specific edges
graph %>%
  get_edge_df()



