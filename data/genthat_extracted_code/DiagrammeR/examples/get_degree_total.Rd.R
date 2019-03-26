library(DiagrammeR)


### Name: get_degree_total
### Title: Get total degree values for all nodes
### Aliases: get_degree_total

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

# Get the total degree values
# for all nodes in the graph
graph %>%
  get_degree_total()

# Add the total degree values
# to the graph as a node
# attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_degree_total(.))

# Display the graph's
# node data frame
graph %>%
  get_node_df()



