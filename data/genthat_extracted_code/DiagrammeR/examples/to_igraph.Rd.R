library(DiagrammeR)


### Name: to_igraph
### Title: Convert a DiagrammeR graph to an igraph one
### Aliases: to_igraph

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 36,
    m = 50,
    set_seed = 23)

# Confirm that `graph` is a
# DiagrammeR graph by getting
# the object's class
class(graph)

# Convert the DiagrammeR graph
# to an igraph object
ig_graph <- to_igraph(graph)

# Get the class of the converted
# graph, just to be certain
class(ig_graph)

# Get a summary of the igraph
# graph object
summary(ig_graph)



