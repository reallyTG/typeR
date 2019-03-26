library(DiagrammeR)


### Name: do_bfs
### Title: Use the breadth-first search (bfs) algorithm
### Aliases: do_bfs

### ** Examples

# Create a graph containing
# two balanced trees
graph <-
  create_graph() %>%
  add_balanced_tree(
    k = 2, h = 2) %>%
  add_balanced_tree(
    k = 3, h = 2)

# Perform a breadth-first
# search of the graph,
# beginning at the root node
# `1` (the default
# `direction = "all"` doesn't
# take edge direction into
# account)
graph %>%
  do_bfs(node = 1)

# If not specifying a
# starting node, the function
# will begin the search from
# a random node
graph %>%
  do_bfs()

# It's also possible to
# perform bfs while taking
# into account edge direction;
# using `direction = "in"`
# causes the bfs routine to
# visit nodes along inward edges
graph %>%
  do_bfs(
    node = 1,
    direction = "in")

# Using `direction = "out"`
# results in the bfs moving
# along solely outward edges
graph %>%
  do_bfs(
    node = 1,
    direction = "out")



