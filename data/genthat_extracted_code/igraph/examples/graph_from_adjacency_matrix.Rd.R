library(igraph)


### Name: graph_from_adjacency_matrix
### Title: Create graphs from adjacency matrices
### Aliases: graph_from_adjacency_matrix graph.adjacency from_adjacency
### Keywords: graphs

### ** Examples


adjm <- matrix(sample(0:1, 100, replace=TRUE, prob=c(0.9,0.1)), nc=10)
g1 <- graph_from_adjacency_matrix( adjm )
adjm <- matrix(sample(0:5, 100, replace=TRUE,
                      prob=c(0.9,0.02,0.02,0.02,0.02,0.02)), nc=10)
g2 <- graph_from_adjacency_matrix(adjm, weighted=TRUE)
E(g2)$weight

## various modes for weighted graphs, with some tests
nzs <- function(x) sort(x [x!=0])
adjm <- matrix(runif(100), 10)
adjm[ adjm<0.5 ] <- 0
g3 <- graph_from_adjacency_matrix((adjm + t(adjm))/2, weighted=TRUE,
                      mode="undirected")

g4 <- graph_from_adjacency_matrix(adjm, weighted=TRUE, mode="max")
all(nzs(pmax(adjm, t(adjm))[upper.tri(adjm)]) == sort(E(g4)$weight))

g5 <- graph_from_adjacency_matrix(adjm, weighted=TRUE, mode="min")
all(nzs(pmin(adjm, t(adjm))[upper.tri(adjm)]) == sort(E(g5)$weight))

g6 <- graph_from_adjacency_matrix(adjm, weighted=TRUE, mode="upper")
all(nzs(adjm[upper.tri(adjm)]) == sort(E(g6)$weight))

g7 <- graph_from_adjacency_matrix(adjm, weighted=TRUE, mode="lower")
all(nzs(adjm[lower.tri(adjm)]) == sort(E(g7)$weight))

g8 <- graph_from_adjacency_matrix(adjm, weighted=TRUE, mode="plus")
d2 <- function(x) { diag(x) <- diag(x)/2; x }
all(nzs((d2(adjm+t(adjm)))[lower.tri(adjm)]) == sort(E(g8)$weight))

g9 <- graph_from_adjacency_matrix(adjm, weighted=TRUE, mode="plus", diag=FALSE)
d0 <- function(x) { diag(x) <- 0 }
all(nzs((d0(adjm+t(adjm)))[lower.tri(adjm)]) == sort(E(g9)$weight))

## row/column names
rownames(adjm) <- sample(letters, nrow(adjm))
colnames(adjm) <- seq(ncol(adjm))
g10 <- graph_from_adjacency_matrix(adjm, weighted=TRUE, add.rownames="code")
summary(g10)




