library(mdpeer)


### Name: L2L.normalized
### Title: Compute normalized version of graph Laplacian matrix
### Aliases: L2L.normalized

### ** Examples

# Define exemplary adjacency matrix
p1 <- 10
p2 <- 40
p <- p1 + p2
A <- matrix(rep(0, p * p), p, p)
A[1:p1, 1:p1] <- 1
A[(p1 + 1):p, (p1 + 1):p] <- 1
vizu.mat(A, "adjacency matrix")

# Compute corresponding Laplacian matrix
L <- Adj2Lap(A)
vizu.mat(L, "Laplacian matrix")

# Compute corresponding Laplacian matrix - normalized
L.norm <- L2L.normalized(L)
vizu.mat(L.norm, "L Laplacian matrix (normalized)")




