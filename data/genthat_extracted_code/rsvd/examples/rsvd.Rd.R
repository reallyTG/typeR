library(rsvd)


### Name: rsvd
### Title: Randomized Singular Value Decomposition (rsvd).
### Aliases: rsvd

### ** Examples

library('rsvd')

# Create a n x n Hilbert matrix of order n,
# with entries H[i,j] = 1 / (i + j + 1).
hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
H <- hilbert(n=50)

# Low-rank (k=10) matrix approximation using rsvd
k=10
s <- rsvd(H, k=k)
Hre <- s$u %*% diag(s$d) %*% t(s$v) # matrix approximation
print(100 * norm( H - Hre, 'F') / norm( H,'F')) # percentage error
# Compare to truncated base svd
s <- svd(H)
Hre <- s$u[,1:k] %*% diag(s$d[1:k]) %*% t(s$v[,1:k]) # matrix approximation
print(100 * norm( H - Hre, 'F') / norm( H,'F')) # percentage error




