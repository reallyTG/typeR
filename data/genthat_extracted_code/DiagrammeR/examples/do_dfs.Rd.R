library(DiagrammeR)


### Name: do_dfs
### Title: Use the depth-first search (dfs) algorithm
### Aliases: do_dfs

### ** Examples

# Create a graph containing
# two balanced trees
graph <-
  create_graph() %>%
  add_balanced_tree(
    k = 2, h = 2) %>%
  add_balanced_tree(
  k = 3, h = 2)

# Perform a depth-first
# search of the graph,
# beginning at the root
# node `1` (the default
# `direction = "all"`
# doesn't take edge
# direction into account)
graph %>%
  do_dfs(node = 1)

# If not specifying a
# starting node, the function
# will begin the search
# from a random node
graph %>%
  do_dfs()

# It's also possible to
# perform dfs while taking
# into account edge direction;
# using `direction = "in"`
# causes the dfs routine to
# visit nodes along inward edges
graph %>%
  do_dfs(
    node = 1,
    direction = "in")

# Using `direction = "out"`
# results in the dfs moving
# along solely outward edges
graph %>%
  do_dfs(
    node = 1,
    direction = "out")



