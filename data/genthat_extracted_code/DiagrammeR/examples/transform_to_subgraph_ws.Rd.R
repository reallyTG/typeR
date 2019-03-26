library(DiagrammeR)


### Name: transform_to_subgraph_ws
### Title: Create a subgraph using node/edge selection
### Aliases: transform_to_subgraph_ws

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 6,
    value =
      c(3.5, 2.6, 9.4,
        2.7, 5.2, 2.1))

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 2, 4, 5, 2, 6),
      to = c(2, 4, 1, 3, 5, 5))

# Create a graph
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Create a selection of nodes, this selects
# nodes `1`, `3`, and `5`
graph <-
  graph %>%
  select_nodes(
    conditions = value > 3)

# Create a subgraph based on the selection
subgraph <-
  graph %>%
  transform_to_subgraph_ws()

# Display the graph's node data frame
subgraph %>%
  get_node_df()

# Display the graph's edge data frame
subgraph %>%
  get_edge_df()



