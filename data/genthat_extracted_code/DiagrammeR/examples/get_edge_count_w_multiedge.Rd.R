library(DiagrammeR)


### Name: get_edge_count_w_multiedge
### Title: Get count of edge definitions where multiple edges occur
### Aliases: get_edge_count_w_multiedge

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

# Get the total number of edge
# definitions (e.g., `4` -> `1`) where
# there are multiple edges (i.e.,
# distinct edges with separate edge
# ID values)
graph %>%
  get_edge_count_w_multiedge()



