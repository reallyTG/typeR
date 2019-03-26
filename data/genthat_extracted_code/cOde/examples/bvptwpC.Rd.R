library(cOde)


### Name: bvptwpC
### Title: Interface to bvptwp()
### Aliases: bvptwpC

### ** Examples

## Not run: 
##D 
##D ######################################################################
##D ## Boundary value problem: Ozon formation with fixed ozon/oxygen ratio
##D ## at final time point
##D ######################################################################
##D 
##D library(bvpSolve)
##D 
##D # O2 + O <-> O3
##D # diff = O2 - O3
##D # build_O3 = const.
##D f <- c(
##D   O3 = " build_O3 * O2 * O - decay_O3 * O3",
##D   O2 = "-build_O3 * O2 * O + decay_O3 * O3",
##D   O  = "-build_O3 * O2 * O + decay_O3 * O3",
##D   diff = "-2 * build_O3 * O2 * O + 2 * decay_O3 * O3", 
##D   build_O3 = "0"
##D )
##D 
##D bound <- data.frame(
##D     name = names(f),
##D     yini = c(0, 3, 2, 3, NA),
##D     yend = c(NA, NA, NA, 0, NA)
##D )
##D 
##D # Generate ODE function
##D func <- funC(f, jacobian="full", boundary = bound, modelname = "example4")
##D 
##D # Initialize times, states, parameters and forcings
##D times <- seq(0, 15, by = .1)
##D pars <- c(decay_O3 = .1)
##D xguess <- times
##D yguess <- matrix(c(1, 1, 1, 1, 1), ncol=length(times), 
##D                  nrow = length(f))
##D 
##D # Solve BVP
##D out <- bvptwpC(x = times, func = func, parms = pars, 
##D                xguess = xguess, yguess = yguess)
##D 
##D # Solve BVP for different ini values, end values and parameters
##D yini <- c(O3 = 2)
##D yend <- c(diff = 0.2)
##D pars <- c(decay_O3 = .01)
##D out <- bvptwpC(yini = yini, yend = yend, x = times, func = func, 
##D 	       parms = pars, xguess = xguess, yguess = yguess)
##D 
##D # Plot solution
##D par(mfcol=c(1,2))
##D t <- out[,1]
##D M1 <- out[,2:5]
##D M2 <- cbind(out[,6], pars)
##D 
##D matplot(t, M1, type="l", lty=1, col=1:4, 
##D         xlab="time", ylab="value", main="states")
##D legend("topright", legend = c("O3", "O2", "O", "O2 - O3"), 
##D        lty=1, col=1:4)
##D matplot(t, M2, type="l", lty=1, col=1:2, 
##D         xlab="time", ylab="value", main="parameters")
##D legend("right", legend = c("build_O3", "decay_O3"), lty=1, col=1:2)
##D 
## End(Not run)



