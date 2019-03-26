library(DiagrammeR)


### Name: add_star
### Title: Add a star of nodes to the graph
### Aliases: add_star

### ** Examples

# Create a new graph and add 2
# stars of varying numbers of nodes
graph <-
  create_graph() %>%
  add_star(
    n = 4,
    type = "four_star") %>%
  add_star(
    n = 5,
    type = "five_star")

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
  add_star(
    n = 4,
    label = c(
      "one", "two",
      "three", "four"),
    type = c(
      "a", "a", "b", "b"),
    rel = "A",
    node_aes = node_aes(
      fillcolor = "steelblue"),
    edge_aes = edge_aes(
      color = "red",
      penwidth = 1.2),
    node_data = node_data(
      value = c(
        1.6, 2.8, 3.4, 8.3)),
    edge_data = edge_data(
      value =
        rnorm(
          n = 3,
          mean = 5.0,
          sd = 1.0)))

# Get the graph's node data frame
graph_w_attrs %>%
  get_node_df()

# Get the graph's edge data frame
graph_w_attrs %>%
  get_edge_df()



