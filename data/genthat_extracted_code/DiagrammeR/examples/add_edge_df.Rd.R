library(DiagrammeR)


### Name: add_edge_df
### Title: Add edges from an edge data frame to an existing graph object
### Aliases: add_edge_df

### ** Examples

# Create a graph with 4 nodes
# and no edges
graph <-
  create_graph() %>%
  add_n_nodes(n = 4)

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 2, 3),
      to = c(4, 3, 1))

# Add the edge data frame to
# the graph object to create
# a graph with both nodes
# and edges
graph <-
  graph %>%
  add_edge_df(
    edge_df = edf)

# Get the graph's edges to
# verify that the edf had
# been added
graph %>%
  get_edges(
    return_type = "vector")



