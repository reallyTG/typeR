library(DiagrammeR)


### Name: export_csv
### Title: Export a graph to CSV files
### Aliases: export_csv

### ** Examples

# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 4,
    type = c("a", "a", "z", "z"),
    label = TRUE,
    value = c(3.5, 2.6, 9.4, 2.7))

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = c("rel_a", "rel_z", "rel_a"))

# Create a graph with the ndf and edf
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Create separate `nodes.csv` and `edges.csv`
# files in the working directory
graph %>%
  export_csv()



