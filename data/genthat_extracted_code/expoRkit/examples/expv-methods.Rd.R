library(expoRkit)


### Name: expv
### Title: Matrix exponentiation and more.
### Aliases: expv expv,CsparseMatrix,vector-method
###   expv,TsparseMatrix,vector-method expv,dgCMatrix,vector-method
###   expv,matrix,vector-method expv,matrix.coo,vector-method
###   expv,matrix.csc,vector-method expv,matrix.csr,vector-method
###   expv-methods

### ** Examples

### Small 4 by 4 example.
x <- matrix(c(-1, 0, 1, 0,
              0, -2, 0, -3,
              1, 0, 0, 0,
              0, 2, -1, 0),
            4, 4)
v <- c(1, 1, 1, 1)

require(Matrix)
require(SparseM)

w <- cbind(padm(x) %*% v,
           expv(x, v),
           expv(Matrix(x, sparse = TRUE), v),
           expv(as.matrix.coo(x), v),
           expv(as.matrix.csr(x), v),
           expv(as.matrix.csc(x), v)
           )

stopifnot(all.equal(w[, 1], w[, 2]),
          all.equal(w[, 1], w[, 3]),
          all.equal(w[, 1], w[, 4]),
          all.equal(w[, 1], w[, 5]),
          all.equal(w[, 1], w[, 6]))

u <- c(2, 0, 1, 1)
ex <- padm(x)
w <- cbind(ex %*% v + (ex - diag(1, 4)) %*% solve(x, u),
           expv(x, v, u = u),
           expv(Matrix(x, sparse = TRUE), v, u = u),
           expv(as.matrix.coo(x), v, u = u),
           expv(as.matrix.csr(x), v, u = u),
           expv(as.matrix.csc(x), v, u = u)
           )

stopifnot(all.equal(w[, 1], w[, 2]),
          all.equal(w[, 1], w[, 3]),
          all.equal(w[, 1], w[, 4]),
          all.equal(w[, 1], w[, 5]),
          all.equal(w[, 1], w[, 6]))

############################################################
### Linear birth-death Markov process with immigration
############################################################

alpha <- 2.1  ## Death rate per individual
beta <- 2     ## Birth rate per individual
delta <- 20   ## Immigration rate

n <- 500L     ## state space {0, ..., n-1}
i <- seq(1, n)
rates <- c(alpha * i[-1], ## subdiagonal
           -(c(0, alpha * i[-1]) +
             c(delta, beta * i[-c(1,n)] + delta, 0)), ## diagonal
           c(delta, beta * i[-c(1, n)] + delta)) ## superdiagonal
j <- c(i[-n], i, i[-1])
i <- c(i[-1], i, i[-n])

## Sparse rate matrix constructed without dense intermediate
require(Matrix)
Q <- sparseMatrix(i = i, j = j, x = rates, dims = c(n, n))

## Evolution of uniform initial distribution
p0 <- rep(1, n)/n
time <- seq(0, 10, 0.2)
Pt <- expv(Q, p0, t = time, Markov = TRUE)

## Not run: 
##D matplot(1:n, Pt, type = "l")
##D image(time, 0:(n-1), -t(Pt), col = terrain.colors(100))
## End(Not run)



