library(DiagrammeR)


### Name: add_growing_graph
### Title: Create a random growing graph with m edges added per step
### Aliases: add_growing_graph

### ** Examples

# Create a random, growing
# citation graph with 100
# nodes, adding an edge after
# each node addition
growing_graph <-
  create_graph() %>%
  add_growing_graph(
    n = 100,
    m = 1,
    citation = TRUE,
    set_seed = 23)

# Get a count of nodes
growing_graph %>%
  count_nodes()

# Get a count of edges
growing_graph %>%
  count_edges()



