library(cOde)


### Name: funC
### Title: Generate C code for a function and compile it
### Aliases: funC

### ** Examples

## Not run: 
##D # Exponential decay plus constant supply
##D f <- c(x = "-k*x + supply")
##D func <- funC(f, forcings = "supply")
##D 
##D # Example 2: root function
##D f <- c(A = "-k1*A + k2*B", B = "k1*A - k2*B")
##D rootfunc <- c(steadyState = "-k1*A + k2*B - tol")
##D 
##D func <- funC(f, rootfunc = rootfunc, modelname = "test")
##D 
##D yini <- c(A = 1, B = 2)
##D parms <- c(k1 = 1, k2 = 5, tol = 0.1)
##D times <- seq(0, 10, len = 100)
##D 
##D odeC(yini, times, func, parms)
## End(Not run)



