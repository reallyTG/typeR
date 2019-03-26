library(DiagrammeR)


### Name: from_igraph
### Title: Convert an igraph graph to a DiagrammeR one
### Aliases: from_igraph

### ** Examples

# Create a DiagrammeR graph object
dgr_graph_orig <-
  create_graph() %>%
  add_gnm_graph(
    n = 36,
    m = 50,
    set_seed = 23)

# Convert the DiagrammeR
# graph to an igraph object
ig_graph <-
  dgr_graph_orig %>%
  to_igraph()

# Convert the igraph graph
# back to a DiagrammeR graph
dgr_graph_new <-
  ig_graph %>%
  from_igraph()

# Get some graph information
(dgr_graph_new %>%
  get_graph_info())[, 1:6]



