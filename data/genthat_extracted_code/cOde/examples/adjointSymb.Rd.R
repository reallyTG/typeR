library(cOde)


### Name: adjointSymb
### Title: Compute adjoint equations of a function symbolically
### Aliases: adjointSymb

### ** Examples

## Not run: 
##D 
##D ######################################################################
##D ## Solve an optimal control problem:
##D ######################################################################
##D 
##D library(bvpSolve)
##D 
##D # O2 + O <-> O3
##D # O3 is removed by a variable rate u(t)
##D f <- c(
##D   O3 = " build_O3 * O2 * O - decay_O3 * O3 - u * O3",
##D   O2 = "-build_O3 * O2 * O + decay_O3 * O3",
##D   O  = "-build_O3 * O2 * O + decay_O3 * O3"
##D )
##D 
##D # Compute adjoints equations and replace u by optimal input
##D f_a <- adjointSymb(f, states = c("O3"), inputs = "u")
##D inputs <- attr(f_a, "inputs")
##D f_tot <- replaceSymbols("u", inputs, c(f, f_a))
##D forcings <- attr(f_a, "forcings")
##D 
##D # Initialize times, states, parameters
##D times <- seq(0, 15, by = .1)
##D boundary <- data.frame(
##D   name = c("O3", "O2", "O", "adjO3", "adjO2", "adjO"),
##D   yini = c(0.5, 2, 2.5, NA, NA, NA),
##D   yend = c(NA, NA, NA, 0, 0, 0))
##D 
##D pars <- c(build_O3 = .2, decay_O3 = .1, eps = 1)
##D 
##D # Generate ODE function
##D func <- funC(f = f_tot, forcings = forcings, 
##D              jacobian = "full", boundary = boundary,
##D              modelname = "example5")
##D 
##D # Initialize forcings (the objective)
##D forcData <- data.frame(time = times,
##D                        name = rep(forcings, each=length(times)),
##D                        value = rep(
##D                          c(0.5, 0, 1, 1), each=length(times)))
##D forc <- setForcings(func, forcData)
##D 
##D # Solve BVP
##D out <- bvptwpC(x = times, func = func, parms = pars, forcings = forc)
##D 
##D # Plot solution
##D par(mfcol=c(1,2))
##D t <- out[,1]
##D M1 <- out[,2:4]
##D M2 <- with(list(uD = 0, O3 = out[,2], 
##D                 adjO3 = out[,5], eps = 1, weightuD = 1), 
##D            eval(parse(text=inputs)))
##D 
##D matplot(t, M1, type="l", lty=1, col=1:3, 
##D         xlab="time", ylab="value", main="states")
##D abline(h = .5, lty=2)
##D legend("topright", legend = names(f), lty=1, col=1:3)
##D matplot(t, M2, type="l", lty=1, col=1, 
##D         xlab="time", ylab="value", main="input u")
##D abline(h = 0, lty=2)
##D 
## End(Not run)



