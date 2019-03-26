library(DiagrammeR)


### Name: set_df_as_node_attr
### Title: Set a data frame as a node attribute
### Aliases: set_df_as_node_attr

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

# Create a simple data frame to add as
# a node attribute
df <-
  data.frame(
    a = c("one", "two", "three"),
    b = c(1, 2, 3),
    stringsAsFactors = FALSE)

# Bind the data frame as a node attribute
# of node `1`
graph <-
  graph %>%
  set_df_as_node_attr(
    node = 1,
    df = df)

# Create another data frame to add as
# a node attribute
df_2 <-
  data.frame(
    c = c("four", "five", "six"),
    d = c(4, 5, 6),
    stringsAsFactors = FALSE)

# Bind the data frame as a node attribute
# of node `2`
graph <-
  graph %>%
  set_df_as_node_attr(
    node = 2,
    df = df_2)



