library(DiagrammeR)


### Name: create_graph
### Title: Create a graph object
### Aliases: create_graph

### ** Examples

# With `create_graph()` we can
# simply create an empty graph (and
# add in nodes and edges later
# with other functions)
graph <- create_graph()

# A graph can be created with
# nodes and without having any edges;
# this can be done in 2 steps:
# 1. create a node data frame (ndf)
#    using `create_node_df()`
ndf <-
  create_node_df(n = 4)

# 2. create a new graph object with
#    `create_graph()` and then pass
#    in the ndf to `nodes_df`
graph <-
  create_graph(
    nodes_df = ndf)

# Get information on the graph's nodes
graph %>%
  get_node_info()

# You can create a similar graph with
# just nodes but also providing a
# range of attributes for the nodes
# (e.g., types, labels, or arbitrary
# 'values')
ndf <-
  create_node_df(
    n = 4,
    label = TRUE,
    type = c("type_1", "type_1",
             "type_5", "type_2"),
    shape = c("circle", "circle",
              "rectangle", "rectangle"),
    values = c(3.5, 2.6, 9.4, 2.7))

graph <-
  create_graph(nodes_df = ndf)

# Get information on the graph's
# internal node data frame (ndf)
graph %>%
  get_node_df()

# A graph can also be created by
# specifying both the nodes and
# edges; create an edge data frame
# (edf) using the `create_edge_df()`
# function:
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "leading_to",
    values = c(7.3, 2.6, 8.3))

# 2. create the graph object with
#    `create_graph()` and pass in
#    the ndf and edf objects
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Get information on the graph's
# internal edge data frame (edf)
graph %>%
  get_edge_df()

# Get information on the graph's
# internal node data frame (ndf)
graph %>%
  get_node_df()



