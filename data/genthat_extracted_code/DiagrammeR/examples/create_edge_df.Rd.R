library(DiagrammeR)


### Name: create_edge_df
### Title: Create an edge data frame
### Aliases: create_edge_df

### ** Examples

# Create a simple edge data frame (edf) and
# view the results
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "a")

# Display the edge data frame
edf

# Create an edf with additional edge
# attributes (where their classes will
# be inferred from the input vectors)
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = "a",
    length = c(50, 100, 250),
    color = "green",
    width = c(1, 5, 2))

# Display the edge data frame
edf



