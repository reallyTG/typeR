library(DiagrammeR)


### Name: get_node_ids
### Title: Get a vector of node ID values
### Aliases: get_node_ids

### ** Examples

# Create a node data
# frame (ndf)
ndf <-
  create_node_df(
    n = 4,
    type = "letter",
    color = c(
      "red", "green",
      "blue", "blue"),
    value = c(
      3.5, 2.6, 9.4, 2.7))

# Create a graph using
# the ndf
graph <-
  create_graph(
    nodes_df = ndf)

# Get a vector of all nodes in a graph
graph %>%
  get_node_ids()

# Get a vector of node ID values using a
# numeric comparison (i.e., all nodes with
# `value` attribute greater than 3)
graph %>%
  get_node_ids(
    conditions = value > 3)

# Get a vector of node ID values using
# a match pattern (i.e., all nodes with
# `color` attribute of `green`)
graph %>%
  get_node_ids(
    conditions = color == "green")

# Use multiple conditions to return nodes
# with the desired attribute values
graph %>%
  get_node_ids(
    conditions =
      color == "blue" &
      value > 5)



