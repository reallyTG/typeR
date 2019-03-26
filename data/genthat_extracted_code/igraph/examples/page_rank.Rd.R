library(igraph)


### Name: page_rank
### Title: The Page Rank algorithm
### Aliases: page_rank page.rank page.rank.old page_rank_old page_rank_old
### Keywords: graphs

### ** Examples


g <- sample_gnp(20, 5/20, directed=TRUE)
page_rank(g)$vector

g2 <- make_star(10)
page_rank(g2)$vector

# Personalized PageRank
g3 <- make_ring(10)
page_rank(g3)$vector
reset <- seq(vcount(g3))
page_rank(g3, personalized=reset)$vector



