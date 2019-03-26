library(DiagrammeR)


### Name: is_edge_loop
### Title: Is the edge a loop edge?
### Aliases: is_edge_loop

### ** Examples

# Create a graph that has multiple
# loop edges
graph <-
  create_graph() %>%
  add_path(n = 4) %>%
  add_edge(
    from = 1,
    to = 1) %>%
  add_edge(
    from = 3,
    to = 3)

# Get the graph's internal
# edge data frame
graph %>%
  get_edge_df()

# Determine if edge `4` is
# a loop edge
graph %>%
  is_edge_loop(edge = 4)

# Determine if edge `2` is
# a loop edge
graph %>%
  is_edge_loop(edge = 2)



