library(DiagrammeR)


### Name: layout_nodes_w_string
### Title: Layout nodes using a text-based schematic
### Aliases: layout_nodes_w_string

### ** Examples

# Create a graph with unique labels and
# several node `type` groupings
graph <-
  create_graph() %>%
  add_node(type = "a", label = "a") %>%
  add_node(type = "a", label = "b") %>%
  add_node(type = "b", label = "c") %>%
  add_node(type = "b", label = "d") %>%
  add_node(type = "b", label = "e") %>%
  add_node(type = "c", label = "f") %>%
  add_node(type = "c", label = "g")

# Define a 'layout' for groups of nodes
# using a text string (dashes are empty
# grid cells, numbers--representing
# ad-hoc groupings--correspond to
# individual nodes); here, define a layout
# with 3 groups of nodes
layout <-
"
1--------
1--------
---222---
--------3
--------3
"

# Use the `layout` along with what nodes
# the numbers correspond to in the graph
# with the `nodes` named vectors; the
# optional `sort` vector describes how
# we should sort the collection of node
# before adding position information
graph <-
  graph %>%
  layout_nodes_w_string(
    layout = layout,
    nodes = c("1" = "type:a",
              "2" = "type:b",
              "3" = "type:c"),
    sort = c("1" = "label:asc",
             "2" = "label:desc",
             "3" = "label:desc"))

# Show the graph's node data frame
# to confirm that `x` and `y` values
# were added to each of the nodes
graph %>%
  get_node_df()



