library(dga)


### Name: MakeCompMatrix
### Title: Component-wise Matrix of Log Marginal Likelihoods
### Aliases: MakeCompMatrix
### Keywords: Bayesian model averaging marginal likelihood

### ** Examples


## The function is currently defined as
function (p, delta, Y) 
{
    compLMLs <- matrix(0, nrow = 2^p - 1, ncol = length(Nmissing))
    bins <- integer.base.b(1:(2^p - 1), 2)
    for (i in 1:(2^p - 1)) {
        inds <- which(bins[i, ] == 1)
        D <- c(apply(Y, inds, sum))
        Dmat <- t(matrix(D, ncol = length(Nmissing), nrow = length(D)))
        Dmat[, 1] <- Dmat[, 1] + Nmissing
        alpha <- rep(delta * 2^(p - sum(bins[i, ])), ncol(Dmat))
        compLMLs[i, ] <- CompLogML(Dmat, alpha)
    }
    return(compLMLs)
  }



