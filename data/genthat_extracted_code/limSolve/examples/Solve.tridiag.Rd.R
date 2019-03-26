library(limSolve)


### Name: Solve.tridiag
### Title: Solution of a tridiagonal system of linear equations
### Aliases: Solve.tridiag
### Keywords: array

### ** Examples
# create tridagonal system: bands on diagonal, above and below
nn   <- 20                          # nr rows and columns of A
aa   <- runif(nn)
bb   <- runif(nn)
cc   <- runif(nn)

# full matrix
A                        <- matrix(nrow = nn, ncol = nn, data = 0)
diag(A)                  <- bb
A[cbind(1:(nn-1), 2:nn)] <- cc[-nn]
A[cbind(2:nn, 1:(nn-1))] <- aa[-1]
B <- runif(nn)

# solve as full matrix
solve(A, B)                           

# same,  now using tridiagonal algorithm
as.vector(Solve.tridiag(aa[-1], bb, cc[-nn], B))

# same, now with 3 different right hand sides
B3 <- cbind(B, B*2, B*3)
Solve.tridiag(aa[-1], bb, cc[-nn], B3)




