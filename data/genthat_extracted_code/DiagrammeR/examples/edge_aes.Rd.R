library(DiagrammeR)


### Name: edge_aes
### Title: Insert edge aesthetic attributes during edge creation
### Aliases: edge_aes

### ** Examples

# Create a new graph and add
# a path with several edge
# aesthetic attributes
graph <-
  create_graph() %>%
  add_path(
    n = 3,
    type = "path",
    edge_aes = edge_aes(
      style = "dot",
      color = c("red", "blue")))

# View the graph's internal
# node data frame; the node
# aesthetic attributes have
# been inserted
graph %>%
  get_edge_df()



