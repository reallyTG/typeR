library(DiagrammeR)


### Name: add_pa_graph
### Title: Add a preferential attachment graph
### Aliases: add_pa_graph

### ** Examples

# Create an undirected PA
# graph with 100 nodes, adding
# 2 edges at every time step
pa_graph <-
  create_graph(
    directed = FALSE) %>%
  add_pa_graph(
    n = 100,
    m = 1)

# Get a count of nodes
pa_graph %>%
  count_nodes()

# Get a count of edges
pa_graph %>%
  count_edges()



