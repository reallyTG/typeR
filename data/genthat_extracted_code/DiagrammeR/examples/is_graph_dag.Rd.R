library(DiagrammeR)


### Name: is_graph_dag
### Title: Is the graph a directed acyclic graph?
### Aliases: is_graph_dag

### ** Examples

# Create a directed graph containing
# only a balanced tree
graph_tree <-
  create_graph() %>%
  add_balanced_tree(
    k = 2, h = 3)

# Determine whether this graph
# is a DAG
graph_tree %>%
  is_graph_dag()

# Create a directed graph containing
# a single cycle
graph_cycle <-
  create_graph() %>%
  add_cycle(n = 5)

# Determine whether this graph
# is a DAG
graph_cycle %>%
  is_graph_dag()

# Create an undirected graph
# containing a balanced tree
graph_tree_undirected <-
  create_graph(
    directed = FALSE) %>%
  add_balanced_tree(
    k = 2, h = 2)

# Determine whether this graph
# is a DAG
graph_tree_undirected %>%
  is_graph_dag()



