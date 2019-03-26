library(igraph)


### Name: are_adjacent
### Title: Are two vertices adjacent?
### Aliases: are_adjacent are.connected

### ** Examples

ug <- make_ring(10)
ug
are_adjacent(ug, 1, 2)
are_adjacent(ug, 2, 1)

dg <- make_ring(10, directed = TRUE)
dg
are_adjacent(ug, 1, 2)
are_adjacent(ug, 2, 1)



