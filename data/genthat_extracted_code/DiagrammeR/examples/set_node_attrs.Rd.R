library(DiagrammeR)


### Name: set_node_attrs
### Title: Set node attribute values
### Aliases: set_node_attrs

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 4,
    type = "basic",
    label = TRUE,
    value = c(3.5, 2.6, 9.4, 2.7))

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "leading_to")

# Create a graph
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Set attribute `color = "green"` for
# nodes `1` and `3` using the graph object
graph <-
  graph %>%
  set_node_attrs(
    node_attr = color,
    values = "green",
    nodes = c(1, 3))

# View the graph's node data frame
graph %>%
  get_node_df()

# Set attribute `color = "blue"` for
# all nodes in the graph
graph <-
  graph %>%
  set_node_attrs(
    node_attr = color,
    values = "blue")

# Display the graph's ndf
graph %>%
  get_node_df()



