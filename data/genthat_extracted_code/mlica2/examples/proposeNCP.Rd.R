library(mlica2)


### Name: proposeNCP
### Title: Number of independent components proposal function
### Aliases: proposeNCP

### ** Examples


## The function is currently defined as
function (prPCA, thresh = 0.1) 
{
    X <- prPCA$X
    eigenvals.v <- diag(prPCA$Dx)
    Ex <- prPCA$Ex
    ntp <- nrow(X)
    ndim <- ncol(X)
    print("About to find ncp")
    p.cpts <- eigenvals.v[eigenvals.v > thresh]
    ncp <- length(p.cpts)
    pCorr <- diag(eigenvals.v[1:ncp])
    pEx <- Ex[, 1:ncp]
    x <- matrix(nrow = ntp, ncol = ncp)
    for (g in 1:ntp) {
        for (c in 1:ncp) {
            x[g, c] <- sum(X[g, ] * Ex[, c])/sqrt(diag(pCorr)[c])
        }
    }
    return(list(X = X, x = x, pEx = pEx, pCorr = pCorr, ncp = ncp))
  }



