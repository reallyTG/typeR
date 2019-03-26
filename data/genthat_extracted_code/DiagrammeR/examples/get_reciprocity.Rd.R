library(DiagrammeR)


### Name: get_reciprocity
### Title: Get the graph reciprocity
### Aliases: get_reciprocity

### ** Examples

# Define a graph where 2 edge definitions
# have pairs of reciprocal edges
graph <-
  create_graph() %>%
  add_cycle(n = 3) %>%
  add_node(
    from = 1,
      to = 1) %>%
  add_node(
    from = 1,
      to = 1)

# Get the graph reciprocity, which will
# be calculated as the ratio 4/7 (where
# 4 is the number reciprocating edges
# and 7 is the total number of edges
# in the graph)
graph %>%
  get_reciprocity()

# For an undirected graph, all edges
# are reciprocal, so the ratio will
# always be 1
graph %>%
  set_graph_undirected() %>%
  get_reciprocity()

# For a graph with no edges, the graph
# reciprocity cannot be determined (and
# the same NA result is obtained from an
# empty graph)
create_graph() %>%
  add_n_nodes(n = 5) %>%
  get_reciprocity()



