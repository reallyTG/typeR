library(DiagrammeR)


### Name: node_aes
### Title: Insert node aesthetic attributes during node creation
### Aliases: node_aes

### ** Examples

# Create a new graph and add
# a path with several node
# aesthetic attributes
graph <-
  create_graph() %>%
  add_path(
    n = 3,
    type = "path",
    node_aes = node_aes(
      shape = "circle",
      x = c(1, 3, 2),
      y = c(4, -1, 3)))

# View the graph's internal
# node data frame; the node
# aesthetic attributes have
# been inserted
graph %>%
  get_node_df()



