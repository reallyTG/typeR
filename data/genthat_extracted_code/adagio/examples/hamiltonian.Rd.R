library(adagio)


### Name: hamiltonian
### Title: Finds a Hamiltonian path or cycle
### Aliases: hamiltonian
### Keywords: graphs

### ** Examples

## Dodekaeder graph
D20_edges <- c(
     1,  2,  1,  5,  1,  6,  2,  3,  2,  8,  3,  4,  3, 10,  4,  5,  4, 12,
     5, 14,  6,  7,  6, 15,  7,  8,  7, 16,  8,  9,  9, 10,  9, 17, 10, 11,
    11, 12, 11, 18, 12, 13, 13, 14, 13, 19, 14, 15, 15, 20, 16, 17, 16, 20, 
    17, 18, 18, 19, 19, 20)
hamiltonian(D20_edges, cycle = TRUE)
# [1]  1  2  3  4  5 14 13 12 11 10  9  8  7 16 17 18 19 20 15  6
hamiltonian(D20_edges, cycle = FALSE)
# [1]  1  2  3  4  5 14 13 12 11 10  9  8  7  6 15 20 16 17 18 19

## Herschel graph
# The Herschel graph the smallest non-Hamiltonian polyhedral graph.
H11_edges <- c(
     1,  2,  1,  8,  1,  9,  1, 10,  2,  3,  2, 11,  3,  4,  3,  9,  4,  5,
     4, 11,  5,  6,  5,  9,  5, 10,  6,  7,  6, 11,  7,  8,  7, 10,  8, 11)
hamiltonian(H11_edges, cycle = FALSE)
# NULL

## Not run: 
##D ## Example: Graph constructed from squares
##D N <- 45  # 23, 32, 45
##D Q <- (2:trunc(sqrt(2*N-1)))^2
##D sq_edges <- c()
##D for (i in 1:(N-1)) {
##D     for (j in (i+1):N) {
##D         if ((i+j) ##D 
##D             sq_edges <- c(sq_edges, i, j)
##D     }
##D }
##D 
##D require(igraph)
##D sq_graph <- make_graph(sq_edges, directed=FALSE)
##D plot(sq_graph)
##D 
##D if (N == 23) {
##D     # does not find a path with start=1 ...
##D     hamiltonian(sq_edges, start=18, cycle=FALSE)
##D     # hamiltonian(sq_edges)                     # NULL
##D } else if (N == 32) {
##D     # the first of these graphs that is Hamiltonian ...
##D     # hamiltonian(sq_edges, cycle=FALSE)
##D     hamiltonian(sq_edges)
##D } else if (N == 45) {
##D     # takes much too long ...
##D     # hamiltonian(sq_edges, cycle=FALSE)
##D     hamiltonian(sq_edges)
##D }
## End(Not run)



