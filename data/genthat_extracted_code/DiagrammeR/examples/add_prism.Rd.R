library(DiagrammeR)


### Name: add_prism
### Title: Add a prism of nodes to the graph
### Aliases: add_prism

### ** Examples

# Create a new graph and
# add 2 prisms
graph <-
  create_graph() %>%
  add_prism(
    n = 3,
    type = "prism",
    label = "a") %>%
  add_prism(
    n = 3,
    type = "prism",
    label = "b")

# Get node information from this graph
graph %>%
  get_node_info()

# Node and edge aesthetic and data
# attributes can be specified in
# the `node_aes`, `edge_aes`,
# `node_data`, and `edge_data`
# arguments

set.seed(23)

graph_w_attrs <-
  create_graph() %>%
  add_prism(
    n = 3,
    label = c(
      "one", "two",
      "three", "four",
      "five", "six"),
    type = c(
      "a", "a",
      "b", "b",
      "c", "c"),
    rel = "A",
    node_aes = node_aes(
      fillcolor = "steelblue"),
    edge_aes = edge_aes(
      color = "red",
      penwidth = 1.2),
    node_data = node_data(
      value = c(
        1.6, 2.8, 3.4,
        3.2, 5.3, 6.2)),
    edge_data = edge_data(
      value =
        rnorm(
          n = 9,
          mean = 5.0,
          sd = 1.0)))

# Get the graph's node data frame
graph_w_attrs %>%
  get_node_df()

# Get the graph's edge data frame
graph_w_attrs %>%
  get_edge_df()



