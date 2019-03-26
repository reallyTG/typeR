library(DiagrammeR)


### Name: get_degree_out
### Title: Get outdegree values for all nodes
### Aliases: get_degree_out

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph(
    directed = FALSE) %>%
  add_gnm_graph(
    n = 10,
    m = 15,
    set_seed = 23)

# Get the outdegree values
# for all nodes in the graph
graph %>%
  get_degree_out()

# Add the outdegree values
# to the graph as a node
# attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_degree_out(.))

# Display the graph's
# node data frame
graph %>%
  get_node_df()



