library(DiagrammeR)


### Name: combine_edfs
### Title: Combine multiple edge data frames into a single edge data frame
### Aliases: combine_edfs

### ** Examples

# Create an edge data frame (edf)
edf_1 <-
  create_edge_df(
    from = c(1, 1, 2, 3),
    to = c(2, 4, 4, 1),
    rel = "requires",
    color = "green",
    data = c(2.7, 8.9, 2.6, 0.6))

# Create a second edge data frame
edf_2 <-
  create_edge_df(
    from = c(5, 7, 8, 8),
    to = c(7, 8, 6, 5),
    rel = "receives",
    arrowhead = "dot",
    color = "red")

# Combine the two edge data frames
all_edges <-
  combine_edfs(edf_1, edf_2)

# View the combined edge data frame
all_edges



