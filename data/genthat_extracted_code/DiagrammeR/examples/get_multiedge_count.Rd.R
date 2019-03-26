library(DiagrammeR)


### Name: get_multiedge_count
### Title: Get the count of multiple edges
### Aliases: get_multiedge_count

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 5,
    label = TRUE)

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 4, 4, 3, 5, 1, 3, 4),
      to = c(4, 1, 1, 2, 2, 2, 2, 1))

# Create a graph with the ndf and edf
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Get the total number of multiple
# edges (those edges that share an
# edge definition) in the graph
graph %>%
  get_multiedge_count()



