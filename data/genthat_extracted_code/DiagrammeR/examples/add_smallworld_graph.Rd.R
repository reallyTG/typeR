library(DiagrammeR)


### Name: add_smallworld_graph
### Title: Add a Watts-Strogatz small-world graph
### Aliases: add_smallworld_graph

### ** Examples

# Create an undirected smallworld
# graph with 100 nodes using
# a probability value of 0.05
smallworld_graph <-
  create_graph(
    directed = FALSE) %>%
  add_smallworld_graph(
    dimension = 1,
    size = 50,
    neighborhood = 1,
    p = 0.05,
    set_seed = 23)

# Get a count of nodes
smallworld_graph %>%
  count_nodes()

# Get a count of edges
smallworld_graph %>%
  count_edges()



