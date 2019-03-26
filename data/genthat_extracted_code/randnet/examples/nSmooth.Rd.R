library(randnet)


### Name: nSmooth
### Title: estimates probabilty matrix by neighborhood smoothing
### Aliases: nSmooth

### ** Examples



N <- 300

U = matrix(1:N,nrow=1) / (N+1)
V = matrix(1:N,nrow=1) / (N+1)

W = (t(U))^2
W = W/3*cos(1/(W + 1e-7)) + 0.15



upper.index <- which(upper.tri(W))

A <- matrix(0,N,N)


rand.ind <- runif(length(upper.index))

edge.index <- upper.index[rand.ind < W[upper.index]]

A[edge.index] <- 1

A <- A + t(A)
diag(A) <- 0

#What <- nSmooth(A)





