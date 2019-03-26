library(igraph)


### Name: print.igraph.vs
### Title: Show a vertex sequence on the screen
### Aliases: print.igraph.vs

### ** Examples

# Unnamed graphs
g <- make_ring(10)
V(g)

# Named graphs
g2 <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10])
V(g2)

# All vertices in the sequence
g3 <- make_ring(1000)
V(g3)
print(V(g3), full = TRUE)

# Metadata
g4 <- make_ring(10) %>%
  set_vertex_attr("name", value = LETTERS[1:10]) %>%
  set_vertex_attr("color", value = "red")
V(g4)[[]]
V(g4)[[2:5, 7:8]]



