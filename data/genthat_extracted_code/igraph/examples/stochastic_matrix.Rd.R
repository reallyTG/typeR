library(igraph)


### Name: stochastic_matrix
### Title: Stochastic matrix of a graph
### Aliases: stochastic_matrix get.stochastic
### Keywords: graphs

### ** Examples


library(Matrix)
## g is a large sparse graph
g <- sample_pa(n = 10^5, power = 2, directed = FALSE)
W <- stochastic_matrix(g, sparse=TRUE)

## a dense matrix here would probably not fit in the memory
class(W)

## may not be exactly 1, due to numerical errors
max(abs(rowSums(W))-1)




