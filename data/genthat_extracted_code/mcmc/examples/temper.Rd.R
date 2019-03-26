library(mcmc)


### Name: temper
### Title: Simulated Tempering and Umbrella Sampling
### Aliases: temper temper.function temper.tempering
### Keywords: misc

### ** Examples

d <- 9
witch.which <- c(0.1, 0.3, 0.5, 0.7, 1.0)
ncomp <- length(witch.which)

neighbors <- matrix(FALSE, ncomp, ncomp)
neighbors[row(neighbors) == col(neighbors) + 1] <- TRUE
neighbors[row(neighbors) == col(neighbors) - 1] <- TRUE

ludfun <- function(state, log.pseudo.prior = rep(0, ncomp)) {
    stopifnot(is.numeric(state))
    stopifnot(length(state) == d + 1)
    icomp <- state[1]
    stopifnot(icomp == as.integer(icomp))
    stopifnot(1 <= icomp && icomp <= ncomp)
    stopifnot(is.numeric(log.pseudo.prior))
    stopifnot(length(log.pseudo.prior) == ncomp)
    theta <- state[-1]
    if (any(theta > 1.0)) return(-Inf)
    bnd <- witch.which[icomp]
    lpp <- log.pseudo.prior[icomp]
    if (any(theta > bnd)) return(lpp)
    return(- d * log(bnd) + lpp)
}

# parallel tempering
thetas <- matrix(0.5, ncomp, d)
out <- temper(ludfun, initial = thetas, neighbors = neighbors, nbatch = 20,
    blen = 10, nspac = 5, scale = 0.56789, parallel = TRUE, debug = TRUE)

# serial tempering
theta.initial <- c(1, rep(0.5, d))
# log pseudo prior found by trial and error
qux <- c(0, 9.179, 13.73, 16.71, 20.56)

out <- temper(ludfun, initial = theta.initial, neighbors = neighbors,
    nbatch = 50, blen = 30, nspac = 2, scale = 0.56789,
    parallel = FALSE, debug = FALSE, log.pseudo.prior = qux)



