library(cOde)


### Name: sensitivitiesSymb
### Title: Compute sensitivity equations of a function symbolically
### Aliases: sensitivitiesSymb

### ** Examples

## Not run: 
##D 
##D ######################################################################
##D ## Sensitivity analysis of ozone formation
##D ######################################################################
##D 
##D library(deSolve)
##D 
##D # O2 + O <-> O3
##D f <- c(
##D   O3 = " build_O3 * O2 * O - decay_O3 * O3",
##D   O2 = "-build_O3 * O2 * O + decay_O3 * O3",
##D   O  = "-build_O3 * O2 * O + decay_O3 * O3"
##D )
##D 
##D # Compute sensitivity equations
##D f_s <- sensitivitiesSymb(f)
##D 
##D # Generate ODE function
##D func <- funC(c(f, f_s))
##D 
##D # Initialize times, states, parameters and forcings
##D times <- seq(0, 15, by = .1)
##D yini <- c(O3 = 0, O2 = 3, O = 2, attr(f_s, "yini"))
##D pars <- c(build_O3 = .1, decay_O3 = .01)
##D 
##D # Solve ODE
##D out <- odeC(y = yini, times = times, func = func, parms = pars)
##D 
##D # Plot solution
##D par(mfcol=c(2,3))
##D t <- out[,1]
##D M1 <- out[,2:4]
##D M2 <- out[,5:7]
##D M3 <- out[,8:10]
##D M4 <- out[,11:13]
##D M5 <- out[,14:16]
##D M6 <- out[,17:19]
##D 
##D matplot(t, M1, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="solution")
##D legend("topright", legend = c("O3", "O2", "O"), lty=1, col=1:3)
##D matplot(t, M2, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d O3)")
##D matplot(t, M3, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d O2)")
##D matplot(t, M4, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d O)")
##D matplot(t, M5, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d build_O3)")
##D matplot(t, M6, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d decay_O3)")
##D 
## End(Not run)
## Not run: 
##D 
##D ######################################################################
##D ## Sensitivity analysis of ozone formation with Sundials solver
##D ######################################################################
##D 
##D 
##D # O2 + O <-> O3
##D f <- c(
##D   O3 = " build_O3 * O2 * O - decay_O3 * O3",
##D   O2 = "-build_O3 * O2 * O + decay_O3 * O3",
##D   O  = "-build_O3 * O2 * O + decay_O3 * O3"
##D )
##D 
##D # Generate ODE function
##D func <- funC(f, solver = "Sundials", modelname = "ozon")
##D 
##D # Change attributes of func to cause the solver evaluate sensitivities
##D extended <- func
##D attr(extended, "deriv") <- TRUE
##D attr(extended, "variables") <- c(
##D   attr(func, "variables"), 
##D   attr(func, "variablesSens"))
##D 
##D # Initialize times, states, parameters and forcings
##D times <- seq(0, 15, by = .1)
##D yini <- c(O3 = 0, O2 = 3, O = 2)
##D pars <- c(build_O3 = .1, decay_O3 = .01)
##D 
##D 
##D # Solve ODE without sensitivities
##D out <- odeC(yini, times, func, pars, method = "bdf")
##D # Solve ODE with sensitivities
##D out <- odeC(yini, times, extended, pars, method = "bdf")
##D 
##D # Plot solution
##D par(mfcol=c(2,3))
##D t <- out[,1]
##D M1 <- out[,2:4]
##D M2 <- out[,5:7]
##D M3 <- out[,8:10]
##D M4 <- out[,11:13]
##D M5 <- out[,14:16]
##D M6 <- out[,17:19]
##D 
##D matplot(t, M1, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="solution")
##D legend("topright", legend = c("O3", "O2", "O"), lty=1, col=1:3)
##D matplot(t, M2, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d O3)")
##D matplot(t, M3, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d O2)")
##D matplot(t, M4, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d O)")
##D matplot(t, M5, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d build_O3)")
##D matplot(t, M6, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="d/(d decay_O3)")
##D 
## End(Not run)
## Not run: 
##D 
##D ######################################################################
##D ## Estimate parameter values from experimental data
##D ######################################################################
##D 
##D library(deSolve)
##D 
##D # O2 + O <-> O3
##D # diff = O2 - O3
##D # build_O3 = const.
##D f <- c(
##D   O3 = " build_O3 * O2 * O - decay_O3 * O3",
##D   O2 = "-build_O3 * O2 * O + decay_O3 * O3",
##D   O  = "-build_O3 * O2 * O + decay_O3 * O3"
##D )
##D 
##D # Compute sensitivity equations and get attributes
##D f_s <- sensitivitiesSymb(f)
##D chi <- attr(f_s, "chi")
##D grad <- attr(f_s, "grad")
##D forcings <- attr(f_s, "forcings")
##D 
##D # Generate ODE function
##D func <- funC(f = c(f, f_s, chi, grad), forcings = forcings, 
##D              fcontrol = "nospline", modelname = "example3")
##D 
##D # Initialize times, states, parameters
##D times <- seq(0, 15, by = .1)
##D yini <- c(O3 = 0, O2 = 2, O = 2.5)
##D yini_s <- attr(f_s, "yini")
##D yini_chi <- c(chi = 0)
##D yini_grad <- rep(0, length(grad)); names(yini_grad) <- names(grad)
##D pars <- c(build_O3 = .2, decay_O3 = .1)
##D 
##D # Initialize forcings (the data)
##D data(oxygenData)
##D forcData <- data.frame(time = oxygenData[,1],
##D                        name = rep(
##D                          colnames(oxygenData[,-1]), 
##D                          each=dim(oxygenData)[1]),
##D                        value = as.vector(oxygenData[,-1]))
##D forc <- setForcings(func, forcData)
##D 
##D # Solve ODE
##D out <- odeC(y = c(yini, yini_s, yini_chi, yini_grad), 
##D             times = times, func = func, parms = pars, forcings = forc,
##D             method = "lsodes")
##D 
##D # Plot solution
##D par(mfcol=c(1,2))
##D t <- out[,1]
##D M1 <- out[,2:4]
##D M2 <- out[,names(grad)]
##D tD <- oxygenData[,1]
##D M1D <- oxygenData[,2:4]
##D 
##D matplot(t, M1, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="states")
##D matplot(tD, M1D, type="b", lty=2, col=1:3, pch=4, add=TRUE)
##D legend("topright", legend = names(f), lty=1, col=1:3)
##D matplot(t, M2, type="l", lty=1, col=1:5, 
##D         xlab="time", ylab="value", main="gradient")
##D legend("topleft", legend = names(grad), lty=1, col=1:5)
##D 
##D # Define objective function
##D obj <- function(p) {
##D   out <- odeC(y = c(p[names(f)], yini_s, yini_chi, yini_grad), 
##D               times = times, func = func, parms = p[names(pars)], 
##D 	      forcings = forc, method="lsodes")
##D   
##D   value <- as.vector(tail(out, 1)[,"chi"])
##D   gradient <- as.vector(
##D     tail(out, 1)[,paste("chi", names(p), sep=".")])
##D   hessian <- gradient%*%t(gradient)
##D   
##D   return(list(value = value, gradient = gradient, hessian = hessian))
##D }
##D 
##D # Fit the data
##D myfit <- optim(par = c(yini, pars), 
##D                fn = function(p) obj(p)$value, 
##D                gr = function(p) obj(p)$gradient,
##D                method = "L-BFGS-B", 
##D                lower=0,
##D                upper=5)
##D 
##D # Model prediction for fit parameters
##D prediction <- odeC(y = c(myfit$par[1:3], yini_s, yini_chi, yini_grad), 
##D                    times = times, func = func, parms = myfit$par[4:5], 
##D 		   forcings = forc, method = "lsodes")
##D 
##D # Plot solution
##D par(mfcol=c(1,2))
##D t <- prediction[,1]
##D M1 <- prediction[,2:4]
##D M2 <- prediction[,names(grad)]
##D tD <- oxygenData[,1]
##D M1D <- oxygenData[,2:4]
##D 
##D matplot(t, M1, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="states")
##D matplot(tD, M1D, type="b", lty=2, col=1:3, pch=4, add=TRUE)
##D legend("topright", legend = names(f), lty=1, col=1:3)
##D matplot(t, M2, type="l", lty=1, col=1:5, 
##D         xlab="time", ylab="value", main="gradient")
##D legend("topleft", legend = names(grad), lty=1, col=1:5)
##D 
## End(Not run)



