library(DiagrammeR)


### Name: get_agg_degree_total
### Title: Get an aggregate value from the total degree of nodes
### Aliases: get_agg_degree_total

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 20,
    m = 35,
    set_seed = 23) %>%
  set_node_attrs(
    node_attr = value,
    values = rnorm(
      n = count_nodes(.),
      mean = 5,
      sd = 1) %>% round(1))

# Get the mean total degree
# value from all nodes in
# the graph
graph %>%
  get_agg_degree_total(
    agg = "mean")

# Other aggregation functions
# can be used (`min`, `max`,
# `median`, `sum`); let's get
# the median in this example
graph %>%
  get_agg_degree_total(
    agg = "median")

# The aggregation of total
# degree can occur for a
# subset of the graph nodes
# and this is made possible
# by specifying `conditions`
# for the nodes
graph %>%
  get_agg_degree_total(
    agg = "mean",
    conditions = value < 5.0)



