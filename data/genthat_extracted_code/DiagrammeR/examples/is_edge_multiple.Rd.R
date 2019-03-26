library(DiagrammeR)


### Name: is_edge_multiple
### Title: Is the edge a multiple edge?
### Aliases: is_edge_multiple

### ** Examples

# Create a graph that has multiple
# edges across some node pairs
graph <-
  create_graph() %>%
  add_path(n = 4) %>%
  add_edge(
    from = 1,
    to = 2) %>%
  add_edge(
    from = 3,
    to = 4)

# Get the graph's internal
# edge data frame
graph %>%
  get_edge_df()

# Determine if edge `1` is
# a multiple edge
graph %>%
  is_edge_multiple(edge = 1)

# Determine if edge `2` is
# a multiple edge
graph %>%
  is_edge_multiple(edge = 2)



