library(igraph)


### Name: print.igraph.es
### Title: Print an edge sequence to the screen
### Aliases: print.igraph.es

### ** Examples

# Unnamed graphs
g <- make_ring(10)
E(g)

# Named graphs
g2 <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10])
E(g2)

# All edges in a long sequence
g3 <- make_ring(200)
E(g3)
E(g3) %>% print(full = TRUE)

# Metadata
g4 <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10]) %>%
  set_edge_attr("weight", value = 1:10) %>%
  set_edge_attr("color", value = "green")
E(g4)
E(g4)[[]]
E(g4)[[1:5]]



