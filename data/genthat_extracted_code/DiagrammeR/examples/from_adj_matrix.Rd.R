library(DiagrammeR)


### Name: from_adj_matrix
### Title: Create a graph using an adjacency matrix
### Aliases: from_adj_matrix

### ** Examples

# Create an adjacency matrix
adj_matrix <-
  sample(0:1, 100,
         replace = TRUE,
         prob = c(0.9,0.1)) %>%
  matrix(nc = 10)

# Create a graph from the adjacency matrix
graph <-
  from_adj_matrix(adj_matrix)



