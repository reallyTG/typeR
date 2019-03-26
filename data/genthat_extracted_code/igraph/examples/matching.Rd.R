library(igraph)


### Name: is_matching
### Title: Graph matching
### Aliases: is_matching is.matching is.maximal.matching is_max_matching
###   maximum.bipartite.matching max_bipartite_match is_max_matching
###   max_bipartite_match

### ** Examples

g <- graph_from_literal( a-b-c-d-e-f )
m1 <- c("b", "a", "d", "c", "f", "e")   # maximal matching
m2 <- c("b", "a", "d", "c", NA, NA)     # non-maximal matching
m3 <- c("b", "c", "d", "c", NA, NA)     # not a matching
is_matching(g, m1)
is_matching(g, m2)
is_matching(g, m3)
is_max_matching(g, m1)
is_max_matching(g, m2)
is_max_matching(g, m3)

V(g)$type <- c(FALSE,TRUE)
print_all(g, v=TRUE)
max_bipartite_match(g)

g2 <- graph_from_literal( a-b-c-d-e-f-g )
V(g2)$type <- rep(c(FALSE,TRUE), length=vcount(g2))
print_all(g2, v=TRUE)
max_bipartite_match(g2)
#' @keywords graphs



