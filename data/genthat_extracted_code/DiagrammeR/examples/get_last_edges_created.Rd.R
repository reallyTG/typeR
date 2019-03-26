library(DiagrammeR)


### Name: get_last_edges_created
### Title: Get the last set of edges created in a graph
### Aliases: get_last_edges_created

### ** Examples

# Create a graph and add a cycle and then
# a tree in 2 separate function calls
graph <-
  create_graph() %>%
  add_cycle(
    n = 3,
    rel = "a") %>%
  add_balanced_tree(
    k = 2, h = 2,
    rel = "b")

# Get the last edges created (all edges
# from the tree)
graph %>%
  get_last_edges_created()



