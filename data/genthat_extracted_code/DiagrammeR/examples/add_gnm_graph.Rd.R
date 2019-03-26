library(DiagrammeR)


### Name: add_gnm_graph
### Title: Add a G(n, m) Erdos-Renyi graph
### Aliases: add_gnm_graph

### ** Examples

# Create an undirected GNM
# graph with 100 nodes and
# 120 edges
gnm_graph <-
  create_graph(
    directed = FALSE) %>%
  add_gnm_graph(
    n = 100,
    m = 120)

# Get a count of nodes
gnm_graph %>%
  count_nodes()

# Get a count of edges
gnm_graph %>%
  count_edges()



