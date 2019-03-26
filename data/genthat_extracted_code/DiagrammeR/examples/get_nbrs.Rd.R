library(DiagrammeR)


### Name: get_nbrs
### Title: Get all neighbors of one or more nodes
### Aliases: get_nbrs

### ** Examples

# Create a simple, directed graph with 5
# nodes and 4 edges
graph <-
  create_graph() %>%
  add_path(n = 5)

# Find all neighbor nodes for node `2`
graph %>%
  get_nbrs(nodes = 2)

# Find all neighbor nodes for nodes `1`
# and `5`
graph %>%
  get_nbrs(nodes = c(1, 5))

# Color node `3` with purple, get its
# neighbors and color those nodes green
graph <-
  graph %>%
  select_nodes_by_id(nodes = 3) %>%
  set_node_attrs_ws(
    node_attr = color,
    value = "purple") %>%
  clear_selection() %>%
  select_nodes_by_id(
    nodes = get_nbrs(
      graph = .,
      nodes = 3)) %>%
  set_node_attrs_ws(
    node_attr = color,
    value = "green")



