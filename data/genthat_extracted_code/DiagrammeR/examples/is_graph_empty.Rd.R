library(DiagrammeR)


### Name: is_graph_empty
### Title: Is the graph empty?
### Aliases: is_graph_empty

### ** Examples

# Create an empty graph
graph <- create_graph()

# Determine whether the graph is empty
graph %>%
  is_graph_empty()

# Create a non-empty graph
graph <-
  create_graph() %>%
  add_n_nodes(n = 3)

# Determine whether this graph is empty
graph %>%
  is_graph_empty()



