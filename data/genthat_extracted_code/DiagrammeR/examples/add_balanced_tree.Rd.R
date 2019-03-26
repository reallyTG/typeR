library(DiagrammeR)


### Name: add_balanced_tree
### Title: Add a balanced tree to the graph
### Aliases: add_balanced_tree

### ** Examples

# Create a new graph and
# add 2 different types of
# balanced trees of height
# 2 (branching twice) and
# different branching ratios
graph <-
  create_graph() %>%
  add_balanced_tree(
    k = 2,
    h = 2,
    type = "binary") %>%
  add_balanced_tree(
    k = 3,
    h = 2,
    type = "tertiary")

# Get some node information
# from this graph
graph %>%
  get_node_info() %>%
  head(5)

# Node and edge aesthetic and data
# attributes can be specified in
# the `node_aes`, `edge_aes`,
# `node_data`, and `edge_data`
# arguments
graph_w_attrs <-
  create_graph() %>%
  add_balanced_tree(
    k = 2,
    h = 2,
    label = c(
      "one", "two",
      "three", "four",
      "five", "six", "seven"),
    type = c(
      "a", "b", "b", "c",
      "c", "c", "c"),
    rel = "A",
    node_aes = node_aes(
      fillcolor = "steelblue"),
    node_data = node_data(
      value = c(
        1.6, 2.8, 3.4, 8.3,
        3.8, 5.2, 3.2)),
    edge_aes = edge_aes(
      color = "red",
      penwidth = 1.2))

# Get the first three rows of
# the graph's node data frame
graph_w_attrs %>%
  get_node_df() %>%
  head(3)

# Get the first three rows of
# the graph's edge data frame
graph_w_attrs %>%
  get_edge_df() %>%
  head(3)



