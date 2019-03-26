library(DiagrammeR)


### Name: count_s_connected_cmpts
### Title: Get the number of strongly-connected components
### Aliases: count_s_connected_cmpts

### ** Examples

# Create a graph and add
# several graph islands
graph <-
  create_graph() %>%
  add_islands_graph(
    n_islands = 4,
    island_size = 10,
    p = 1/5,
    edges_between = 1,
    set_seed = 23)

# Get a count of strongly-connected
# components in the graph
graph %>%
  count_s_connected_cmpts()



