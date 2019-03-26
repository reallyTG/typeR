library(DiagrammeR)


### Name: get_degree_in
### Title: Get indegree values for all nodes
### Aliases: get_degree_in

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

# Get the indegree values for
# all nodes in the graph
graph %>%
  get_degree_in()

# Add the indegree values
# to the graph as a node
# attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_degree_in(.))

# Display the graph's
# node data frame
graph %>%
  get_node_df()



