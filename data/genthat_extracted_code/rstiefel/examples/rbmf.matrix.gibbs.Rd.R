library(rstiefel)


### Name: rbmf.matrix.gibbs
### Title: Gibbs Sampling for the Matrix-variate Bingham-von Mises-Fisher
###   Distribution.
### Aliases: rbmf.matrix.gibbs

### ** Examples


## The function is currently defined as
function (A, B, C, X) 
{
    m <- dim(X)[1]
    R <- dim(X)[2]
    if (m > R) {
        for (r in sample(seq(1, R, length = R))) {
            N <- NullC(X[, -r])
            An <- B[r, r] * t(N) %*% (A) %*% N
            cn <- t(N) %*% C[, r]
            X[, r] <- N %*% rbmf.vector.gibbs(An, cn, t(N) %*% 
                X[, r])
        }
    }
    if (m == R) {
        for (s in seq(1, R, length = R)) {
            r <- sort(sample(seq(1, R, length = R), 2))
            N <- NullC(X[, -r])
            An <- t(N) %*% A %*% N
            Cn <- t(N) %*% C[, r]
            X[, r] <- N %*% rbmf.O2(An, B[r, r], Cn)
        }
    }
    X
  }




