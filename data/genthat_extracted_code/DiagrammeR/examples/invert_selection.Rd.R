library(DiagrammeR)


### Name: invert_selection
### Title: Invert selection of nodes or edges in a graph
### Aliases: invert_selection

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 4,
    type = "standard")

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

# Select nodes with ID
# values `1` and `3`
graph <-
  graph %>%
  select_nodes(
    nodes = c(1, 3))

# Verify that a node
# selection has been made
graph %>%
  get_selection()

# Invert the selection
graph <-
  graph %>%
  invert_selection()

# Verify that the node
# selection has been changed
graph %>%
  get_selection()



