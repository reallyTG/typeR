library(DiagrammeR)


### Name: remove_graph_from_graph_series
### Title: Remove a graph from a graph series
### Aliases: remove_graph_from_graph_series

### ** Examples

# Create three graphs
graph_1 <-
  create_graph() %>%
  add_path(n = 4)

graph_2 <-
  create_graph() %>%
  add_cycle(n = 5)

graph_3 <-
  create_graph() %>%
  add_star(n = 6)

# Create an empty graph series
# and add the graphs
series <-
  create_graph_series() %>%
  add_graph_to_graph_series(
    graph = graph_1) %>%
  add_graph_to_graph_series(
    graph = graph_2) %>%
  add_graph_to_graph_series(
    graph = graph_3)

# Remove the second graph
# from the graph series
series <-
  series %>%
  remove_graph_from_graph_series(
    index = 2)

# With `get_graph_series_info()`,
# we can ensure that a graph
# was removed
series %>%
  get_graph_series_info()



