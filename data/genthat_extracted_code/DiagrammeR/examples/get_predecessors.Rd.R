library(DiagrammeR)


### Name: get_predecessors
### Title: Get node IDs for predecessor nodes to the specified node
### Aliases: get_predecessors

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

# Get predecessors for node
# `23` in the graph
graph %>%
  get_predecessors(
    node = 23)

# If there are no predecessors,
# `NA` is returned
graph %>%
  get_predecessors(
    node = 26)



