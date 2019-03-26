library(MaskJointDensity)


### Name: getSampleFromMarginalDistributionOfUnmaskedData
### Title: Second function the End-User uses to obtain the samples from the
###   marginal distributions of the unmasked data
### Aliases: getSampleFromMarginalDistributionOfUnmaskedData
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (xLengths, meansOfNoises, meansOfSquaredNoises, xStars, 
    Vx, mu, s, rho_X, maxSize, choleskySpeed = TRUE, cores = 1, 
    size, returnJointDensity = FALSE, verbose = -1) 
{
    n <- length(xLengths)
    if (missing(mu)) {
        mu <- lapply(1:n, FUN = function(i) {
            mean(xStars[[i]])/meansOfNoises[[i]]
        })
    }
    if (missing(s)) {
        s <- lapply(1:n, FUN = function(i) {
            sqrt((mean(xStars[[i]]^2) - (meansOfSquaredNoises[[i]]) * 
                mean(xStars[[i]])^2/(meansOfNoises[[i]])^2)/(meansOfSquaredNoises[[i]]))
        })
    }
    if (missing(rho_X)) {
        rho_X <- matrix(1, n, n)
        for (i in 1:n) {
            for (j in 1:n) {
                if (i != j) {
                  rho_X[i, j] <- (cov(xStars[[i]], xStars[[j]])/((meansOfNoises[[i]]) * 
                    (meansOfNoises[[j]])))/(s[[i]] * s[[j]])
                  rho_X[j, i] <- rho_X[i, j]
                }
            }
        }
    }
    if (verbose > 1) {
        print(mu)
        print(s)
        print(rho_X)
    }
    if (verbose > 0) {
        print("finished estimating mu, s and rho_X if missing")
    }
    testBoundary <- lapply(1:n, FUN = function(i) {
        return(c(min(Vx[[i]]), max(Vx[[i]])))
    })
    testX <- lapply(1:n, FUN = function(i) {
        return(seq(from = (testBoundary[[i]])[1], to = (testBoundary[[i]])[2], 
            by = ((testBoundary[[i]])[2] - (testBoundary[[i]])[1])/xLengths[[i]]))
    })
    G_Point7 <- c(-3.75043971768, -2.36675941078, -1.1544053948, 
        0, 1.1544053948, 2.36675941078, 3.75043971768)
    GH_Quadrature <- c(0.000548268858737, 0.0307571239681, 0.240123178599, 
        0.457142857143, 0.240123178599, 0.0307571239681, 0.000548268858737)
    if (verbose > 0) {
        print("calculating jointDensityFunction")
    }
    jointDensityFunction <- generalizedJointF(testX, Vx, mu, 
        s, rho_X, G_Point7, GH_Quadrature, maxSize = floor(sqrt(1450000)), 
        choleskySpeed, cores, verbose)
    if (verbose > 0) {
        print("finished calculation of jointDensityFunction")
    }
    boundaryVec <- unlist(testBoundary)
    finalOutput <- actualPosition(dim(jointDensityFunction), 
        jointDensityFunction, boundaryVec, size = size)
    if (returnJointDensity) {
        return(list(sample = finalOutput, jointDensityFunction = jointDensityFunction))
    }
    return(list(sample = finalOutput))
  }



