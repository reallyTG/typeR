library(DiagrammeR)


### Name: get_similar_nbrs
### Title: Get neighboring nodes based on node attribute similarity
### Aliases: get_similar_nbrs

### ** Examples

# Getting similar neighbors can
# be done through numerical comparisons;
# start by creating a random, directed
# graph with 18 nodes and 22 edges
# using the `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 18,
    m = 25,
    set_seed = 23) %>%
  set_node_attrs(
    node_attr = value,
    values = rnorm(
      n = count_nodes(.),
      mean = 5,
      sd = 1) %>% round(0))

# Starting with node `10`, we
# can test whether any nodes
# adjacent and beyond are
# numerically equivalent in `value`
graph %>%
  get_similar_nbrs(
    node = 10,
    node_attr = value)

# We can also set a tolerance
# for ascribing similarly by using
# either the `tol_abs` or `tol_pct`
# arguments (the first applies absolute
# lower and upper bounds from the
# value in the starting node and the
# latter uses a percentage difference
# to do the same); try setting `tol_abs`
# with a fairly large range to
# determine if several nodes can be
# selected
graph %>%
  get_similar_nbrs(
    node = 10,
    node_attr = value,
    tol_abs = c(1, 1))

# That resulted in a fairly large
# set of 4 neigboring nodes; for
# sake of example, setting the range
# to be very large will effectively
# return all nodes in the graph
# except for the starting node
graph %>%
  get_similar_nbrs(
    node = 10,
    node_attr = value,
    tol_abs = c(10, 10)) %>%
    length()



