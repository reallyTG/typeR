library(DiagrammeR)


### Name: is_graph_simple
### Title: Is the graph a simple graph?
### Aliases: is_graph_simple

### ** Examples

# Create a graph with 2 cycles
graph <-
  create_graph() %>%
  add_cycle(n = 4) %>%
  add_cycle(n = 3)

# Check if the graph is simple
graph %>%
  is_graph_simple()



