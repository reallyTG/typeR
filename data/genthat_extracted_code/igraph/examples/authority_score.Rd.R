library(igraph)


### Name: authority_score
### Title: Kleinberg's authority centrality scores.
### Aliases: authority_score authority.score

### ** Examples

## An in-star
g <- make_star(10)
hub_score(g)$vector
authority_score(g)$vector

## A ring
g2 <- make_ring(10)
hub_score(g2)$vector
authority_score(g2)$vector



