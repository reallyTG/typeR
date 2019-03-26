library(DiagrammeR)


### Name: transform_to_complement_graph
### Title: Create a complement of a graph
### Aliases: transform_to_complement_graph

### ** Examples

# Create a simple graph
# with a single cycle
graph <-
  create_graph() %>%
  add_cycle(n = 4)

# Get the graph's edge
# data frame
graph %>%
  get_edge_df()

# Create the complement
# of the graph
graph_c <-
  graph %>%
    transform_to_complement_graph()

# Get the edge data frame
# for the complement graph
graph_c %>%
  get_edge_df()



