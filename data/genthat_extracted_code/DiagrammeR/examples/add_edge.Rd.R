library(DiagrammeR)


### Name: add_edge
### Title: Add an edge between nodes in a graph object
### Aliases: add_edge

### ** Examples

# Create a graph with 4 nodes
graph <-
  create_graph() %>%
  add_node(label = "one") %>%
  add_node(label = "two") %>%
  add_node(label = "three") %>%
  add_node(label = "four")

# Add an edge between those
# nodes and attach a
# relationship to the edge
graph <-
 add_edge(
   graph,
   from = 1,
   to = 2,
   rel = "A")

# Use the `get_edge_info()`
# function to verify that
# the edge has been created
graph %>%
  get_edge_info()

# Add another node and
# edge to the graph
graph <-
  graph %>%
  add_edge(
    from = 3,
    to = 2,
    rel = "A")

# Verify that the edge
# has been created by
# counting graph edges
graph %>%
  count_edges()

# Add edges by specifying
# node `label` values; note
# that all nodes must have
# unique `label` values to
# use this option
graph <-
  graph %>%
  add_edge(
    from = "three",
    to = "four",
    rel = "L") %>%
  add_edge(
    from = "four",
    to = "one",
    rel = "L")

# Use `get_edges()` to verify
# that the edges were added
graph %>%
  get_edges()

# Add edge aesthetic and data
# attributes during edge creation
graph_2 <-
  create_graph() %>%
  add_n_nodes(n = 2) %>%
  add_edge(
    from = 1,
    to = 2,
    rel = "M",
    edge_aes = edge_aes(
      penwidth = 1.5,
      color = "blue"),
    edge_data = edge_data(
      value = 4.3))

# Use the `get_edges()` function
# to verify that the attribute
# values were bound to the
# newly created edge
graph_2 %>%
  get_edge_df()



