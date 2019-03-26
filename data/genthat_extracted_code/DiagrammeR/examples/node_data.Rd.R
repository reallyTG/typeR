library(DiagrammeR)


### Name: node_data
### Title: Insert node data attributes during node creation
### Aliases: node_data

### ** Examples

# Create a new graph and add
# a path with several node
# data attributes
graph <-
  create_graph() %>%
  add_path(
    n = 3,
    type = "path",
    node_data = node_data(
      hour = 5,
      index = c(1, 3, 2)))

# View the graph's internal
# node data frame; the node
# data attributes have been
# inserted
graph %>%
  get_node_df()



