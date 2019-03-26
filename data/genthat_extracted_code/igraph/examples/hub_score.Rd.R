library(igraph)


### Name: hub_score
### Title: Kleinberg's hub centrality scores.
### Aliases: hub_score hub.score

### ** Examples

## An in-star
g <- make_star(10)
hub_score(g)$vector

## A ring
g2 <- make_ring(10)
hub_score(g2)$vector



