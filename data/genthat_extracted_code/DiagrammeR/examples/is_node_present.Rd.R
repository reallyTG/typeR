library(DiagrammeR)


### Name: is_node_present
### Title: Determine whether a specified node is present
### Aliases: is_node_present

### ** Examples

# Create a simple graph with
# a path of four nodes
graph <-
  create_graph() %>%
  add_path(
    n = 4,
    type = "path",
    label = c(
      "one", "two",
      "three", "four"))

# Determine if there is a node
# with ID `1` in the graph
graph %>%
  is_node_present(node = 1)

# Determine if there is a node
# with ID `5` in the graph
graph %>%
  is_node_present(node = 5)

# Determine if there is a node
# with label `two` in the graph
graph %>%
  is_node_present(node = "two")



