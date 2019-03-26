library(DiagrammeR)


### Name: join_node_attrs
### Title: Join new node attribute values using a data frame
### Aliases: join_node_attrs

### ** Examples

# Set a seed
set.seed(23)

# Create a simple graph
graph <-
  create_graph() %>%
  add_n_nodes(n = 5) %>%
  add_edges_w_string(
    edges = "1->2 1->3 2->4 2->5 3->5")

# Create a data frame with node ID values and a
# set of numeric values
df <-
  data.frame(
    values = round(rnorm(6, 5), 2),
    id = 1:6)

# Join the values in the data frame to the
# graph's nodes; this works as a left join using
# identically-named columns in the graph and the df
# (in this case the `id` column is common to both)
graph <-
  graph %>%
  join_node_attrs(
    df = df)

# Get the graph's internal ndf to show that the
# join has been made
graph %>%
  get_node_df()

# Get betweenness values for each node and
# add them as a node attribute (Note the
# common column name `id` in the different
# tables results in a natural join)
graph <-
  graph %>%
  join_node_attrs(
    df = get_betweenness(.))

# Get the graph's internal ndf to show that
# this join has been made
graph %>%
  get_node_df()



