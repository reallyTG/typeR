library(DiagrammeR)


### Name: is_edge_mutual
### Title: Is the edge mutual with another edge?
### Aliases: is_edge_mutual

### ** Examples

# Create a graph that has mutual
# edges across some node pairs
graph <-
  create_graph() %>%
  add_path(n = 4) %>%
  add_edge(
    from = 4,
    to = 3) %>%
  add_edge(
    from = 2,
    to = 1)

# Get the graph's internal
# edge data frame
graph %>%
  get_edge_df()

# Determine if edge `1` has
# a mutual edge
graph %>%
  is_edge_mutual(edge = 1)

# Determine if edge `2` has
# a mutual edge
graph %>%
  is_edge_mutual(edge = 2)



