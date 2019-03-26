library(DiagrammeR)


### Name: add_islands_graph
### Title: Create a random islands graph with edges between the islands
### Aliases: add_islands_graph

### ** Examples

# Create a graph of islands
islands_graph <-
  create_graph() %>%
  add_islands_graph(
    n_islands = 4,
    island_size = 10,
    p = 0.5,
    edges_between = 1,
    set_seed = 23)

# Get a count of nodes
islands_graph %>%
  count_nodes()

# Get a count of edges
islands_graph %>%
  count_edges()



