library(estimability)


### Name: estble.subspace
### Title: Find an estimable subspace
### Aliases: estble.subspace
### Keywords: models regression

### ** Examples

### Find a set of estimable interaction contrasts for a 3 x 4 design 
### with two empty cells.
des <- expand.grid(A = factor(1:3), B = factor(1:4))
des <- des[-c(5, 12), ]  # cells (2,2) and (3,4) are empty

X <- model.matrix(~ A * B, data = des)
N <- nonest.basis(X)

L <- cbind(matrix(0, nrow = 6, ncol = 6), diag(6))
# i.e., give nonzero weight only to interaction effects

estble.subspace(L, N)

# Tougher demo: create a variation where all rows of L are non-estimable
LL <- matrix(rnorm(36), ncol = 6) %*% L
estble.subspace(LL, N)



