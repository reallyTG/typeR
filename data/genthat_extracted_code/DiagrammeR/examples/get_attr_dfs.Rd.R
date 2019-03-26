library(DiagrammeR)


### Name: get_attr_dfs
### Title: Get data frames bound to node attributes
### Aliases: get_attr_dfs

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 4,
    type = "basic",
    label = TRUE,
    value = c(3.5, 2.6, 9.4, 2.7))

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "leading_to")

# Create a graph
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Create 3 simple data frames to add as
# attributes to nodes/edges
df_1 <-
  data.frame(
    a = c("one", "two"),
    b = c(1, 2),
    stringsAsFactors = FALSE)

df_2 <-
  data.frame(
    a = c("three", "four"),
    b = c(3, 4),
    stringsAsFactors = FALSE)

df_for_edges <-
  data.frame(
    c = c("five", "six"),
    d = c(5, 6),
    stringsAsFactors = FALSE)

# Bind data frames as node attributes
# for nodes `1` and `4`; bind a data
# frame as an edge attribute as well
graph <-
  graph %>%
  set_df_as_node_attr(
    node = 1,
    df = df_1) %>%
  set_df_as_node_attr(
    node = 4,
    df = df_2) %>%
  set_df_as_edge_attr(
    edge = 1,
    df = df_for_edges)

# Get a single tibble by specifying the
# nodes from which there are data frames
# bound as node attributes
get_attr_dfs(
  graph,
  node_id = c(1, 4))

# You can also get data frames that are
# associated with edges by using the
# same function
get_attr_dfs(
  graph,
  edge_id = 1)

# It's also possible to collect data frames
# associated with both nodes and edges
get_attr_dfs(
  graph,
  node_id = 4,
  edge_id = 1)

# If a data frame is desired instead,
# set `return_format = "single_df"`
get_attr_dfs(
  graph,
  edge_id = 1,
  return_format = "single_df")



