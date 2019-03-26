library(DiagrammeR)


### Name: add_full_graph
### Title: Add a fully connected graph
### Aliases: add_full_graph

### ** Examples

# Create a new graph object
# and add a directed and fully
# connected graph with 3 nodes
# and edges to and from all
# pairs of nodes; with the option
# `keep_loops = TRUE` nodes
# will also have edges from
# and to themselves
graph <-
  create_graph() %>%
  add_full_graph(
    n = 3, keep_loops = TRUE)

# Get node information
# from this graph
graph %>%
  get_node_info()

# Using `keep_loops = FALSE`
# (the default) will remove
# the loops
create_graph() %>%
  add_full_graph(n = 3) %>%
  get_node_info()

# Values can be set for
# the node `label`, node
# `type`, and edge `rel`
graph <-
  create_graph() %>%
  add_full_graph(
    n = 3,
    type = "connected",
    label = c("1st", "2nd", "3rd"),
    rel = "connected_to")

# Show the graph's node
# data frame (ndf)
graph %>%
  get_node_df()

# Show the graph's edge
# data frame (edf)
graph %>%
  get_edge_df()

# Create a fully-connected and
# directed graph with 3 nodes,
# and, where a matrix provides
# edge weights; first, create the
# matrix (with row names to be
# used as node labels)
set.seed(23)

edge_wt_matrix <-
  rnorm(100, 5, 2) %>%
  sample(9, FALSE) %>%
  round(2) %>%
  matrix(
    nc = 3,
    nr = 3,
    dimnames = list(c("a", "b", "c")))

# Create the fully-connected
# graph (without loops however)
graph <-
  create_graph() %>%
  add_full_graph(
    n = 3,
    type = "weighted",
    label = TRUE,
    rel = "related_to",
    edge_wt_matrix = edge_wt_matrix,
    keep_loops = FALSE)

# Show the graph's node
# data frame (ndf)
graph %>%
  get_node_df()

# Show the graph's edge
# data frame (edf)
graph %>%
  get_edge_df()

# An undirected graph can
# also use a matrix with
# edge weights, but only
# the lower triangle of
# that matrix will be used
create_graph(directed = FALSE) %>%
  add_full_graph(
    n = 3,
    type = "weighted",
    label = TRUE,
    rel = "related_to",
    edge_wt_matrix = edge_wt_matrix,
    keep_loops = FALSE) %>%
  get_edge_df()



