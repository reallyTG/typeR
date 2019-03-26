library(cOde)


### Name: odeC
### Title: Interface to ode()
### Aliases: odeC

### ** Examples

## Not run: 
##D 
##D ######################################################################
##D ## Ozone formation and decay, modified by external forcings
##D ######################################################################
##D 
##D library(deSolve)
##D data(forcData)
##D forcData$value <- forcData$value + 1
##D 
##D # O2 + O <-> O3
##D f <- c(
##D   O3 = " (build_O3 + u_build) * O2 * O - (decay_O3 + u_degrade) * O3",
##D   O2 = "-(build_O3 + u_build) * O2 * O + (decay_O3 + u_degrade) * O3",
##D   O  = "-(build_O3 + u_build) * O2 * O + (decay_O3 + u_degrade) * O3"
##D )
##D 
##D # Generate ODE function
##D forcings <- c("u_build", "u_degrade")
##D func <- funC(f, forcings = forcings, modelname = "test", 
##D              fcontrol = "nospline", nGridpoints = 10)
##D 
##D # Initialize times, states, parameters and forcings
##D times <- seq(0, 8, by = .1)
##D yini <- c(O3 = 0, O2 = 3, O = 2)
##D pars <- c(build_O3 = 1/6, decay_O3 = 1)
##D 
##D forc <- setForcings(func, forcData)
##D 
##D # Solve ODE
##D out <- odeC(y = yini, times = times, func = func, parms = pars, 
##D             forcings = forc)
##D 
##D # Plot solution
##D 
##D par(mfcol=c(1,2))
##D t1 <- unique(forcData[,2])
##D M1 <- matrix(forcData[,3], ncol=2)
##D t2 <- out[,1]
##D M2 <- out[,2:4]
##D M3 <- out[,5:6]
##D 
##D matplot(t1, M1, type="l", lty=1, col=1:2, xlab="time", ylab="value", 
##D 	main="forcings", ylim=c(0, 4))
##D matplot(t2, M3, type="l", lty=2, col=1:2, xlab="time", ylab="value", 
##D 	main="forcings", add=TRUE)
##D 
##D legend("topleft", legend = c("u_build", "u_degrade"), lty=1, col=1:2)
##D matplot(t2, M2, type="l", lty=1, col=1:3, xlab="time", ylab="value", 
##D 	main="response")
##D legend("topright", legend = c("O3", "O2", "O"), lty=1, col=1:3)
##D 
##D 
##D 
##D ######################################################################
##D ## Ozone formation and decay, modified by events
##D ######################################################################
##D 
##D 
##D f <- c(
##D   O3 = " (build_O3 + u_build) * O2 * O - (decay_O3 + u_degrade) * O3",
##D   O2 = "-(build_O3 + u_build) * O2 * O + (decay_O3 + u_degrade) * O3",
##D   O  = "-(build_O3 + u_build) * O2 * O + (decay_O3 + u_degrade) * O3",
##D   u_build = "0",    # piecewise constant
##D   u_degrade = "0"   # piecewise constant
##D )
##D 
##D # Define parametric events
##D events.pars <- data.frame(
##D   var = c("u_degrade", "u_degrade", "u_build"),
##D   time = c("t_on", "t_off", "2"),
##D   value = c("plus", "minus", "2"),
##D   method = "replace"
##D )
##D 
##D # Declar parameteric events when generating funC object
##D func <- funC(f, forcings = NULL, events = events.pars, modelname = "test", 
##D              fcontrol = "nospline", nGridpoints = 10)
##D 
##D # Set Parameters
##D yini <- c(O3 = 0, O2 = 3, O = 2, u_build = 1, u_degrade = 1)
##D times <- seq(0, 8, by = .1)
##D pars <- c(build_O3 = 1/6, decay_O3 = 1, t_on = exp(rnorm(1, 0)), t_off = 6, plus = 3, minus = 1)
##D 
##D # Solve ODE with additional fixed-value events
##D out <- odeC(y = yini, times = times, func = func, parms = pars)
##D 
##D 
##D # Plot solution
##D 
##D par(mfcol=c(1,2))
##D t2 <- out[,1]
##D M2 <- out[,2:4]
##D M3 <- out[,5:6]
##D 
##D 
##D matplot(t2, M3, type="l", lty=2, col=1:2, xlab="time", ylab="value", 
##D         main="events")
##D legend("topleft", legend = c("u_build", "u_degrade"), lty=1, col=1:2)
##D matplot(t2, M2, type="l", lty=1, col=1:3, xlab="time", ylab="value", 
##D         main="response")
##D legend("topright", legend = c("O3", "O2", "O"), lty=1, col=1:3)
##D 
##D 
##D 
##D 
## End(Not run)



