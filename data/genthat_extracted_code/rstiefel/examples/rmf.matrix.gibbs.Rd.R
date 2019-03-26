library(rstiefel)


### Name: rmf.matrix.gibbs
### Title: Gibbs Sampling for the Matrix-variate von Mises-Fisher
###   Distribution
### Aliases: rmf.matrix.gibbs

### ** Examples


Z<-matrix(rnorm(10*5),10,5) 

U<-rmf.matrix(Z)
U<-rmf.matrix.gibbs(Z,U)


## The function is currently defined as
function (M, X, rscol = NULL) 
{
    if (is.null(rscol)) {
        rscol <- max(2, min(round(log(dim(M)[1])), dim(M)[2]))
    }
    sM <- svd(M)
    H <- sM$u %*% diag(sM$d)
    Y <- X %*% sM$v
    m <- dim(H)[1]
    R <- dim(H)[2]
    for (iter in 1:round(R/rscol)) {
        r <- sample(seq(1, R, length = R), rscol)
        N <- NullC(Y[, -r])
        y <- rmf.matrix(t(N) %*% H[, r])
        Y[, r] <- N %*% y
    }
    Y %*% t(sM$v)
  }




