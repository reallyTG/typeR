library(rstiefel)


### Name: rbing.matrix.gibbs
### Title: Gibbs Sampling for the Matrix-variate Bingham Distribution
### Aliases: rbing.matrix.gibbs

### ** Examples


Z<-matrix(rnorm(10*5),10,5) ; A<-t(Z)%*%Z
B<-diag(sort(rexp(5),decreasing=TRUE))
U<-rbing.Op(A,B)
U<-rbing.matrix.gibbs(A,B,U)

## The function is currently defined as
function (A, B, X) 
{
    m <- dim(X)[1]
    R <- dim(X)[2]
    if (m > R) {
        for (r in sample(seq(1, R, length = R))) {
            N <- NullC(X[, -r])
            An <- B[r, r] * t(N) %*% (A) %*% N
            X[, r] <- N %*% rbing.vector.gibbs(An, t(N) %*% X[, 
                r])
        }
    }
    if (m == R) {
        for (s in seq(1, R, length = R)) {
            r <- sort(sample(seq(1, R, length = R), 2))
            N <- NullC(X[, -r])
            An <- t(N) %*% A %*% N
            X[, r] <- N %*% rbing.Op(An, B[r, r])
        }
    }
    X
  }




