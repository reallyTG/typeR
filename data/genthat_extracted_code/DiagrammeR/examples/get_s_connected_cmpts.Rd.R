library(DiagrammeR)


### Name: get_s_connected_cmpts
### Title: Get nodes within strongly connected components
### Aliases: get_s_connected_cmpts

### ** Examples

set.seed(23)

# Create a graph with a random
# connection between 2 different
# node cycles
graph <-
  create_graph() %>%
  add_cycle(
    n = 3,
    type = "cycle_1") %>%
  add_cycle(
    n = 4,
    type = "cycle_2") %>%
  add_edge(
    from =
      get_node_ids(
        graph = .,
        conditions =
          type == "cycle_1") %>%
        sample(size = 1),
    to =
      get_node_ids(
        graph = .,
        conditions =
          type == "cycle_2") %>%
        sample(size = 1))

# Get the strongly connected
# components as a data frame of
# nodes and their groupings
graph %>%
  get_s_connected_cmpts()



