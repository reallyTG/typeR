library(DiagrammeR)


### Name: get_common_nbrs
### Title: Get all common neighbors between two or more nodes
### Aliases: get_common_nbrs

### ** Examples

# Create a directed graph with 5 nodes
graph <-
  create_graph() %>%
  add_path(n = 5)

# Find all common neighbor nodes
# for nodes `1` and `2` (there are no
# common neighbors amongst them)
graph %>%
  get_common_nbrs(
    nodes = c(1, 2))

# Find all common neighbor nodes for
# nodes `1` and `3`
graph %>%
  get_common_nbrs(
    nodes = c(1, 3))



