library(BNPdensity)


### Name: comp1
### Title: Ties function: univariate
### Aliases: comp1
### Keywords: internal

### ** Examples

## The function is currently defined as
function (y) 
{
    n <- length(y)
    mat <- outer(y, y, "==")
    jstar <- led <- rep(FALSE, n)
    for (j in seq(n)) {
        if (!led[j]) {
            jstar[j] <- TRUE
            if (j == n) 
                break
            ji <- seq(j + 1, n)
            tt <- mat[ji, j] %in% TRUE
            led[ji] <- led[ji] | tt
        }
        if (all(led[-seq(j)])) 
            break
    }
    ystar <- y[jstar]
    nstar <- apply(mat[, jstar], 2, sum)
    r <- length(nstar)
    idx <- match(y, ystar)
    return(list(ystar = ystar, nstar = nstar, r = r, idx = idx))
  }



