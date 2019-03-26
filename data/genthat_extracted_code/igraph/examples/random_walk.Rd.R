library(igraph)


### Name: random_walk
### Title: Random walk on a graph
### Aliases: random_walk

### ** Examples

## Stationary distribution of a Markov chain
g <- make_ring(10, directed = TRUE) %u%
  make_star(11, center = 11) + edge(11, 1)

ec <- eigen_centrality(g, directed = TRUE)$vector
pg <- page_rank(g, damping = 0.999)$vector
w <- random_walk(g, start = 1, steps = 10000)

## These are similar, but not exactly the same
cor(table(w), ec)

## But these are (almost) the same
cor(table(w), pg)



