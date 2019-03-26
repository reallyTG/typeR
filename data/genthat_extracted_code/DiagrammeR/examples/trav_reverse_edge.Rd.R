library(DiagrammeR)


### Name: trav_reverse_edge
### Title: Traverse to any reverse edges
### Aliases: trav_reverse_edge

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 4,
    type = "basic",
    label = TRUE)

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 4, 2, 3, 3),
    to =   c(4, 1, 3, 2, 1))

# Create a graph with the
# ndf and edf
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Explicitly select the edges
# `1`->`4` and `2`->`3`
graph <-
  graph %>%
  select_edges(
    from = 1,
      to = 4) %>%
  select_edges(
    from = 2,
      to = 3)

# Get the inital edge selection
graph %>%
  get_selection()

# Traverse to the reverse edges
# (edges `2`: `4`->`1` and
# `4`:`3`->`2`)
graph <-
  graph %>%
  trav_reverse_edge()

# Get the current selection of edges
graph %>%
  get_selection()



