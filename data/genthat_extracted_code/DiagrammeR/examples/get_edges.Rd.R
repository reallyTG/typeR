library(DiagrammeR)


### Name: get_edges
### Title: Get node IDs associated with edges
### Aliases: get_edges

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 4,
    label = c("one", "two", "three", "four"),
    type = "letter",
    color = c("red", "green", "grey", "blue"),
    value = c(3.5, 2.6, 9.4, 2.7))

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "leading_to",
    color = c("pink", "blue", "blue"),
    value = c(3.9, 2.5, 7.3))

# Create a graph
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Get all edges within a graph, returned as a list
graph %>%
  get_edges(
    return_type = "vector")

# Get all edges within a graph, returned as a
# data frame
graph %>%
  get_edges(
    return_type = "df")

# Get all edges returned as a list
graph %>%
  get_edges(
    return_type = "list")

# Get a vector of edges using
# a numeric comparison (i.e.,
# all edges with a `value`
# attribute greater than 3)
graph %>%
  get_edges(
    conditions = value > 3,
    return_type = "vector")

# Get a vector of edges using
# a matching condition
graph %>%
  get_edges(
    conditions = color == "pink",
    return_type = "vector")

# Use multiple conditions to
# return edges with the
# desired attribute values
graph %>%
  get_edges(
    conditions =
      color == "blue" &
      value > 3,
    return_type = "vector")

# Use `return_values = "label"`
# to return the labels of the
# connected nodes
graph %>%
  get_edges(
    conditions =
      color == "blue" &
      value > 3,
    return_type = "vector",
    return_values = "label")



