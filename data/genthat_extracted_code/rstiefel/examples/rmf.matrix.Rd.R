library(rstiefel)


### Name: rmf.matrix
### Title: Simulate a Random Orthonormal Matrix
### Aliases: rmf.matrix

### ** Examples


## The function is currently defined as
Z<-matrix(rnorm(10*5),10,5) 

U<-rmf.matrix(Z)
U<-rmf.matrix.gibbs(Z,U)


function (M) 
{
    if (dim(M)[2] == 1) {
        X <- rmf.vector(M)
    }
    if (dim(M)[2] > 1) {
        svdM <- svd(M)
        H <- svdM$u %*% diag(svdM$d)
        m <- dim(H)[1]
        R <- dim(H)[2]
        cmet <- FALSE
        rej <- 0
        while (!cmet) {
            U <- matrix(0, m, R)
            U[, 1] <- rmf.vector(H[, 1])
            lr <- 0
            for (j in seq(2, R, length = R - 1)) {
                N <- NullC(U[, seq(1, j - 1, length = j - 1)])
                x <- rmf.vector(t(N) %*% H[, j])
                U[, j] <- N %*% x
                if (svdM$d[j] > 0) {
                  xn <- sqrt(sum((t(N) %*% H[, j])^2))
                  xd <- sqrt(sum(H[, j]^2))
                  lbr <- log(besselI(xn, 0.5 * (m - j - 1), expon.scaled = TRUE)) - 
                    log(besselI(xd, 0.5 * (m - j - 1), expon.scaled = TRUE))
                  if (is.na(lbr)) {
                    lbr <- 0.5 * (log(xd) - log(xn))
                  }
                  lr <- lr + lbr + (xn - xd) + 0.5 * (m - j - 
                    1) * (log(xd) - log(xn))
                }
            }
            cmet <- (log(runif(1)) < lr)
            rej <- rej + (1 - 1 * cmet)
        }
        X <- U %*% t(svd(M)$v)
    }
    X
  }




