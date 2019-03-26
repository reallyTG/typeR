library(DiagrammeR)


### Name: get_non_nbrs
### Title: Get non-neighbors of a node in a graph
### Aliases: get_non_nbrs

### ** Examples

# Create a simple, directed graph with 5
# nodes and 4 edges
graph <-
  create_graph() %>%
  add_path(n = 5)

# Find all non-neighbors of node `2`
graph %>%
  get_non_nbrs(node = 2)



