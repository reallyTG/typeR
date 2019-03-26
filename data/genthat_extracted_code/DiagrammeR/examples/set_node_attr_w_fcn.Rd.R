library(DiagrammeR)


### Name: set_node_attr_w_fcn
### Title: Set node attribute values with a graph function
### Aliases: set_node_attr_w_fcn

### ** Examples

# Create a random graph using the
# `add_gnm_graph()` function
graph <-
  create_graph() %>%
  add_gnm_graph(
    n = 10,
    m = 22,
    set_seed = 23) %>%
  set_node_attrs(
    node_attr = value,
    values = rnorm(
      n = count_nodes(.),
      mean = 5,
      sd = 1) %>% round(1))

# Get the betweenness values for
# each of the graph's nodes as a
# node attribute
graph_1 <-
  graph %>%
  set_node_attr_w_fcn(
    node_attr_fcn = "get_betweenness")

# Inspect the graph's internal
# node data frame
graph_1 %>%
  get_node_df()

# If a specified function takes argument
# values, these can be supplied as well
graph_2 <-
  graph %>%
  set_node_attr_w_fcn(
    node_attr_fcn = "get_alpha_centrality",
    alpha = 2,
    exo = 2)

# Inspect the graph's internal
# node data frame
graph_2 %>%
  get_node_df()

# The new column name can be provided
graph_3 <-
  graph %>%
  set_node_attr_w_fcn(
    node_attr_fcn = "get_pagerank",
    column_name = "pagerank")

# Inspect the graph's internal
# node data frame
graph_3 %>%
  get_node_df()

# If `graph_3` is modified by
# adding a new node then the column
# `pagerank` will have stale data; we
# can run the function again and re-use
# the existing column name to provide
# updated values
graph_3 <-
  graph_3 %>%
  add_node(
    from = 1,
    to = 3) %>%
  set_node_attr_w_fcn(
    node_attr_fcn = "get_pagerank",
    column_name = "pagerank")

# Inspect the graph's internal
# node data frame
graph_3 %>%
  get_node_df()



