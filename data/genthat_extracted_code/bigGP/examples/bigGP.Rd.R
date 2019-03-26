library(bigGP)


### Name: bigGP
### Title: Package for Calculations with Big Gaussian Processes
### Aliases: bigGP bigGP-package

### ** Examples

# this is an example of using the API to do distributed linear algebra
#    for Gaussian process calculations; we'll demonstrate generating from
#    a Gaussian process with exponential covariance; note that this can
#    be done more easily through the krigeProblem ReferenceClass
## Not run: 
##D bigGP.init(3)
##D params <- c(sigma2 = 1, rho = 0.25)
##D # for this example, we'll use a modest size problem, but to demo on a
##D #    cluster, increase m to a larger value
##D m <- 80 
##D gd <- seq(0, 1, length = m)
##D locns = expand.grid(x = gd, y = gd)
##D # indices will be a two column matrix with the index of the first set of
##D #  locations in the first column and of the second set in the second column
##D covfunc <- function(params, locns, indices) {
##D dd <- sqrt( (locns$x[indices[,1]] - locns$x[indices[,2]])^2 +
##D (locns$y[indices[,1]] - locns$y[indices[,2]])^2 )
##D return(params["sigma2"] * exp(-dd / params["rho"]))
##D }
##D mpi.bcast.Robj2slave(params)
##D mpi.bcast.Robj2slave(covfunc)
##D mpi.bcast.Robj2slave(locns)
##D mpi.bcast.cmd(indices <- localGetTriangularMatrixIndices(nrow(locns)))
##D mpi.bcast.cmd(C <- covfunc(params, locns, indices))
##D remoteLs() # this may pause before reporting, as slaves are busy doing
##D #    computations above
##D remoteCalcChol('C', 'L', n = m^2)
##D remoteConstructRnormVector('z', n = m^2)
##D remoteMultChol('L', 'z', 'x', n1 = m^2)
##D x <- collectVector('x', n = m^2)
##D image(gd, gd, matrix(x, m))
## End(Not run)



