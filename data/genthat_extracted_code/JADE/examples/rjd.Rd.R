library(JADE)


### Name: rjd
### Title: Joint Diagonalization of Real Matrices
### Aliases: rjd frjd rjd.fortran
### Keywords: array

### ** Examples

Z <- matrix(runif(9), ncol = 3)
U <- eigen(Z %*% t(Z))$vectors
D1 <- diag(runif(3))
D2 <- diag(runif(3))
D3 <- diag(runif(3))
D4 <- diag(runif(3))

X.matrix <- rbind(t(U) %*% D1 %*% U, t(U) %*% D2 %*% U,
                  t(U) %*% D3 %*% U, t(U) %*% D4 %*% U)
res.matrix <- rjd(X.matrix)
res.matrix$V
round(U %*% res.matrix$V, 4) # should be a signed permutation 
                             # matrix if V is correct.

round(res.matrix$D, 4)

# compare to C version

#res.matrix.C <- frjd(X.matrix)
#res.matrix.C$V
#round(U %*% res.matrix.C$V, 4)
#round(res.matrix.C$D, 4)

X.array <- aperm(array(t(X.matrix), dim = c(3,3,4)), c(2,1,3))

res.array <- rjd(X.array)
round(res.array$D, 4)

res.array.C <- frjd(X.array)
round(res.array.C$D, 4)



