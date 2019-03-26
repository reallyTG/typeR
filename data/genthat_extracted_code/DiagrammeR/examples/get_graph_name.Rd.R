library(DiagrammeR)


### Name: get_graph_name
### Title: Get graph name
### Aliases: get_graph_name

### ** Examples

# Create an empty graph
graph <- create_graph()

# Provide the new graph with a name
graph <-
  set_graph_name(
    graph,
    name = "the_name")

# Get the graph's name
graph %>%
  get_graph_name()



