library(DiagrammeR)


### Name: select_edges
### Title: Select edges in a graph
### Aliases: select_edges

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
    rel = c("a", "z", "a"),
    value = c(6.4, 2.9, 5.0))

# Create a graph with the ndf and edf
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Explicitly select the edge `1`->`4`
graph <-
  graph %>%
  select_edges(
    from = 1,
    to = 4)

# Verify that an edge selection has been made
# using the `get_selection()` function
graph %>%
  get_selection()

# Select edges based on the relationship label
# being `z`
graph <-
  graph %>%
  clear_selection() %>%
  select_edges(
    conditions = rel == "z")

# Verify that an edge selection has been made, and
# recall that the `2`->`3` edge uniquely has the
# `z` relationship label
graph %>%
  get_selection()

# Select edges based on the edge value attribute
# being greater than 3.0 (first clearing the current
# selection of edges)
graph <-
  graph %>%
  clear_selection() %>%
  select_edges(
    conditions = value > 3.0)

# Verify that the correct edge selection has been
# made; in this case, edges `1`->`4` and
# `3`->`1` have values for `value` > 3.0
graph %>%
  get_selection()



