library(DiagrammeR)


### Name: get_constraint
### Title: Get constraint scores for one or more graph nodes
### Aliases: get_constraint

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

# Get the constaint scores for all
# nodes in the graph
graph %>%
  get_constraint()

# Get the constaint scores
# for nodes `5` and `7`
graph %>%
  get_constraint(
    nodes = c(5, 7))

# Add the constraint scores
# to the graph as a node
# attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_constraint(.))

# Display the graph's node data frame
graph %>%
  get_node_df()



