library(DiagrammeR)


### Name: deselect_nodes
### Title: Deselect any selected nodes in a graph
### Aliases: deselect_nodes

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
  select_nodes(nodes = c(1, 3)) %>%
  deselect_nodes(nodes = 1)

# Verify that the node selection
# has been made for nodes `1` and
# `3` and that node `1` has been
# deselected (leaving only `3`)
graph %>%
  get_selection()



