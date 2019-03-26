library(netregR)


### Name: invert_exchangeable_matrix
### Title: Invert an exchangeable matrix
### Aliases: invert_exchangeable_matrix
### Keywords: external

### ** Examples

n <- 10
phi <- rphi(n, seed=1)
p <- invert_exchangeable_matrix(n, phi)
I1 <- build_exchangeable_matrix(n, phi) %*% build_exchangeable_matrix(n, p)
range(I1 -  diag(n*(n-1)))   # it works




