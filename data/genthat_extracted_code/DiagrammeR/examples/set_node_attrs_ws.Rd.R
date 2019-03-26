library(DiagrammeR)


### Name: set_node_attrs_ws
### Title: Set node attributes with a node selection
### Aliases: set_node_attrs_ws

### ** Examples

# Create a simple graph
graph <-
  create_graph() %>%
  add_path(n = 6)

# Select specific nodes from the graph and
# apply the node attribute `color = blue` to
# those selected nodes
graph <-
  graph %>%
  select_nodes_by_id(
    nodes = 1:4) %>%
  trav_out() %>%
  set_node_attrs_ws(
    node_attr = color,
    value = "blue")

# Show the internal node data frame to verify
# that the node attribute has been set for
# specific node
graph %>%
  get_node_df()



