library(MaskJointDensity)


### Name: generalizedJointF
### Title: Purely used in getSampleFromMarginalDistributionOfUnmaskedData
### Aliases: generalizedJointF
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, Vx, mu, s, rho_X, G_Point7, GH_Quadrature, maxSize, 
    choleskySpeed = TRUE, cores = 1, verbose = -1) 
{
    numberOfVectors <- length(x)
    if (length(Vx) != numberOfVectors) {
        stop("x and Vx must be the same length")
    }
    numberOfVectors <- length(x)
    if (length(mu) != numberOfVectors) {
        stop("x and mu must be the same length")
    }
    numberOfVectors <- length(x)
    if (length(s) != numberOfVectors) {
        stop("x and s must be the same length")
    }
    n <- unlist(lapply(1:numberOfVectors, FUN = function(i) {
        return(length(x[[i]]))
    }))
    fhat <- lapply(1:numberOfVectors, FUN = function(i) {
        return(kde(x = Vx[[i]], binned = TRUE))
    })
    if (verbose > 1) {
        print("calculating Nataf_rho matrix")
    }
    Nataf_rho <- matrix(rep(1, (numberOfVectors^2)), nrow = numberOfVectors, 
        ncol = numberOfVectors)
    Nataf_rho[upper.tri(Nataf_rho, diag = TRUE)] <- NA
    Nataf_rho <- mclapply(1:numberOfVectors, mc.cores = cores, 
        FUN = function(j) {
            return(lapply(1:numberOfVectors, FUN = function(i) {
                if (verbose > 1) {
                  print("row and column")
                  print(i)
                  print(j)
                }
                if (!is.na(Nataf_rho[i, j])) {
                  return(rho_0(Vx[[j]], Vx[[i]], mu[[j]], mu[[i]], 
                    s[[j]], s[[i]], rho_X[i, j], G_Point7, GH_Quadrature, 
                    verbose))
                } else {
                  return(NA)
                }
            }))
        })
    Nataf_rho <- unlist(Nataf_rho)
    Nataf_rho <- matrix(Nataf_rho, nrow = numberOfVectors, ncol = numberOfVectors)
    diag(Nataf_rho) <- 1
    Nataf_rho[upper.tri(Nataf_rho, diag = FALSE)] <- Nataf_rho[lower.tri(Nataf_rho, 
        diag = FALSE)]
    if (verbose > 1) {
        print("calculating y and phiy")
    }
    y <- lapply(1:numberOfVectors, FUN = function(i) {
        return(qnorm(pkde(x[[i]], fhat[[i]])))
    })
    phiy <- lapply(1:numberOfVectors, FUN = function(i) {
        return(exp(-((y[[i]])^2)/2)/sqrt(2 * pi))
    })
    if (verbose > 1) {
        print("calculating inverse of Nataf_rho")
    }
    A <- solve(Nataf_rho)
    if (verbose > 1) {
        print("calculating all possible combinations")
    }
    allPossibleCombinationsX <- expand.grid(x)
    allPossibleCombinationsY <- expand.grid(y)
    allPossibleCombinationsPhiy <- expand.grid(phiy)
    yIndependentPartOfPhi <- (1/(sqrt((2 * pi)^numberOfVectors * 
        det(Nataf_rho))))
    nrowAllPossibleCombinationsY <- nrow(allPossibleCombinationsY)
    numberOfBins <- ceiling(nrowAllPossibleCombinationsY/maxSize)
    binFactors <- cut(1:nrowAllPossibleCombinationsY, breaks = numberOfBins)
    bins <- split(allPossibleCombinationsY, f = binFactors)
    if (verbose > 1) {
        print(paste("There are ", numberOfBins, " bins."))
    }
    if (choleskySpeed) {
        cholA <- chol(A)
        yDependentPartOfPhi <- unlist(mclapply(1:numberOfBins, 
            mc.cores = cores, FUN = function(i) {
                if (verbose > 1) {
                  print(i)
                }
                temp <- as.matrix(bins[[i]])
                temp <- crossprod(cholA %*% t(temp))
                return(exp(-diag(temp)))
            }))
    }
    else {
        yDependentPartOfPhi <- unlist(mclapply(1:numberOfBins, 
            mc.cores = cores, FUN = function(i) {
                if (verbose > 1) {
                  print(i)
                }
                temp <- as.matrix(bins[[i]])
                temp <- temp %*% A %*% t(temp)
                return(exp(-diag(temp)))
            }))
    }
    if (verbose > 1) {
        print("Moving on to xAndPhiy")
    }
    xAndPhiy <- mclapply(1:numberOfVectors, mc.cores = cores, 
        FUN = function(j) {
            return(dkde(allPossibleCombinationsX[, j], fhat[[j]])/allPossibleCombinationsPhiy[, 
                j])
        })
    if (verbose > 1) {
        print("Taking products of xAndPhiy")
    }
    xAndPhiy <- unlist(apply(as.data.frame(xAndPhiy), 1, FUN = prod))
    f <- yIndependentPartOfPhi * yDependentPartOfPhi * xAndPhiy
    f <- array(f, dim = n)
    return(f)
  }



