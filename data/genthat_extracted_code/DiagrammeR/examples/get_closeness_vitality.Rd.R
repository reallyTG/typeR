library(DiagrammeR)


### Name: get_closeness_vitality
### Title: Get closeness vitality
### Aliases: get_closeness_vitality

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 12,
    set_seed = 23)

# Get closeness vitality values
# for all nodes in the graph
graph %>%
  get_closeness_vitality()

# Add the closeness vitality
# values to the graph as a
# node attribute
graph <-
  graph %>%
  join_node_attrs(
    df = get_closeness_vitality(.))

# Display the graph's
# node data frame
graph %>%
  get_node_df()



