library(igraph)


### Name: match_vertices
### Title: Match Graphs given a seeding of vertex correspondences
### Aliases: match_vertices seeded.graph.match
### Keywords: graphs

### ** Examples


 #require(Matrix)
 g1 <- erdos.renyi.game(10, .1)
 randperm <- c(1:3, 3+sample(7))
 g2 <- sample_correlated_gnp(g1, corr=1, p=g1$p, perm=randperm)
 A  <- as.matrix(get.adjacency(g1))
 B  <- as.matrix(get.adjacency(g2))
 P  <-match_vertices (A, B, m=3, start=diag(rep(1, nrow(A)-3)), 20)
 P



