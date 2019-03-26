library(DiagrammeR)


### Name: select_nodes
### Title: Select nodes in a graph
### Aliases: select_nodes

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 4,
    type = c("a", "a", "z", "z"),
    label = TRUE,
    value = c(3.5, 2.6, 9.4, 2.7))

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = c("a", "z", "a"))

# Create a graph with the ndf and edf
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Explicitly select nodes `1` and `3`
graph <-
  graph %>%
  select_nodes(nodes = c(1, 3))

# Verify that the node selection has been made
# using the `get_selection()` function
graph %>%
  get_selection()

# Select nodes based on the node `type`
# being `z`
graph <-
  graph %>%
  clear_selection() %>%
  select_nodes(
    conditions = type == "z")

# Verify that an node selection has been made, and
# recall that the `3` and `4` nodes are of the
# `z` type
graph %>%
  get_selection()

# Select edges based on the node value attribute
# being greater than 3.0 (first clearing the current
# selection of nodes)
graph <-
  graph %>%
  clear_selection() %>%
  select_nodes(
    conditions = value > 3.0)

# Verify that the correct node selection has been
# made; in this case, nodes `1` and `3` have values
# for `value` greater than 3.0
graph %>%
  get_selection()



