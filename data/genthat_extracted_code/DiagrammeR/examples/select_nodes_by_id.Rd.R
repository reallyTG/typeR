library(DiagrammeR)


### Name: select_nodes_by_id
### Title: Select nodes in a graph by ID values
### Aliases: select_nodes_by_id

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(n = 10)

# Create a graph
graph <-
  create_graph(
    nodes_df = ndf)

# Select nodes `1` to `5` and show that
# selection of nodes with `get_selection()`
graph %>%
  select_nodes_by_id(nodes = 1:5) %>%
  get_selection()



