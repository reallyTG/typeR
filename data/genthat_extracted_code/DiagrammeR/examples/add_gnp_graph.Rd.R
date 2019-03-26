library(DiagrammeR)


### Name: add_gnp_graph
### Title: Add a G(n, p) Erdos-Renyi graph
### Aliases: add_gnp_graph

### ** Examples

# Create an undirected GNP
# graph with 100 nodes using
# a probability value of 0.05
gnp_graph <-
  create_graph(
    directed = FALSE) %>%
  add_gnp_graph(
    n = 100,
    p = 0.05)

# Get a count of nodes
gnp_graph %>%
  count_nodes()

# Get a count of edges
gnp_graph %>%
  count_edges()



