library(DiagrammeR)


### Name: get_paths
### Title: Get paths from a specified node in a directed graph
### Aliases: get_paths

### ** Examples

# Create a simple graph
graph <-
  create_graph() %>%
  add_n_nodes(n = 8) %>%
  add_edge(from = 1, to = 2) %>%
  add_edge(from = 1, to = 3) %>%
  add_edge(from = 3, to = 4) %>%
  add_edge(from = 3, to = 5) %>%
  add_edge(from = 4, to = 6) %>%
  add_edge(from = 2, to = 7) %>%
  add_edge(from = 7, to = 5) %>%
  add_edge(from = 4, to = 8)

# Get a list of all paths outward from node `1`
graph %>%
  get_paths(from = 1)

# Get a list of all paths leading to node `6`
graph %>%
  get_paths(to = 6)

# Get a list of all paths from `1` to `5`
graph %>%
  get_paths(
   from = 1,
   to = 5)

# Get a list of all paths from `1` up to a distance
# of 2 node traversals
graph %>%
  get_paths(
    from = 1,
    distance = 2)

# Get a list of the shortest paths from `1` to `5`
get_paths(
  graph,
  from = 1,
  to = 5,
  shortest_path = TRUE)

# Get a list of the longest paths from `1` to `5`
get_paths(
  graph,
  from = 1,
  to = 5,
  longest_path = TRUE)



