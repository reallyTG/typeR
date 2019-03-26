library(DiagrammeR)


### Name: get_successors
### Title: Get node IDs for successor nodes to the specified node
### Aliases: get_successors

### ** Examples

# Set a seed
set.seed(23)

# Create a node data frame (ndf)
ndf <- create_node_df(n = 26)

# Create an edge data
# frame (edf)
edf <-
  create_edge_df(
    from = sample(
      1:26, replace = TRUE),
    to = sample(
      1:26, replace = TRUE))

# From the ndf and edf,
# create a graph object
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Get sucessors for node
# `4` in the graph
graph %>%
  get_successors(
    node = 4)

# If there are no successors,
# NA is returned
graph %>%
  get_successors(
    node = 1)



