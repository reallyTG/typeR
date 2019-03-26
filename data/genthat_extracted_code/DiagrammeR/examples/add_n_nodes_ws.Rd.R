library(DiagrammeR)


### Name: add_n_nodes_ws
### Title: Add a multiple of new nodes with edges to or from one or more
###   selected nodes
### Aliases: add_n_nodes_ws

### ** Examples

# Create an empty graph, add a node to it, select
# that node, and then add 5 more nodes to the graph
# with edges from the original node to all of the
# new nodes
graph <-
  create_graph() %>%
  add_n_nodes(n = 1) %>%
  select_last_nodes_created() %>%
  add_n_nodes_ws(
    n = 5,
    direction = "from")

# Get the graph's nodes
graph %>%
  get_node_ids()
#> [1] 1 2 3 4 5 6

# Get the graph's edges
graph %>%
  get_edges()
#> "1->2" "1->3" "1->4" "1->5" "1->6"

# Create an empty graph, add a node to it, select
# that node, and then add 5 more nodes to the graph
# with edges toward the original node from all of
# the new nodes
graph <-
  create_graph() %>%
  add_n_nodes(n = 1) %>%
  select_last_nodes_created() %>%
  add_n_nodes_ws(
    n = 5,
    direction = "to")

# Get the graph's nodes
graph %>%
  get_node_ids()
#> [1] 1 2 3 4 5 6

# Get the graph's edges
graph %>%
  get_edges()
#> "2->1" "3->1" "4->1" "5->1" "6->1"



