library(DiagrammeR)


### Name: set_edge_attrs
### Title: Set edge attribute values
### Aliases: set_edge_attrs

### ** Examples

# Create a simple graph
ndf <-
  create_node_df(
    n = 4,
    type = "basic",
    label = TRUE,
    value = c(3.5, 2.6, 9.4, 2.7))

edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "leading_to")

graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Set attribute `color = "green"`
# for edges `1`->`4` and `3`->`1`
# in the graph
graph <-
  graph %>%
  set_edge_attrs(
    edge_attr = color,
    values = "green",
    from = c(1, 3),
    to = c(4, 1))

# Set attribute `color = "blue"`
# for all edges in the graph
graph <-
  graph %>%
  set_edge_attrs(
    edge_attr = color,
    values = "blue")

# Set attribute `color = "pink"`
# for all edges in graph outbound
# from node with ID value `1`
graph <-
  graph %>%
  set_edge_attrs(
    edge_attr = color,
    values = "pink",
    from = 1)

# Set attribute `color = "black"`
# for all edges in graph inbound
# to node with ID `1`
graph <-
  graph %>%
  set_edge_attrs(
    edge_attr = color,
    values = "black",
    to = 1)



