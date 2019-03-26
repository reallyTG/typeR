library(nlsrk)


### Name: dfdt
### Title: Right Side of a first order ODE
### Aliases: dfdt
### Keywords: nonlinear

### ** Examples

## Solves and draws the logistic function using default dfdt as provided in the package	

	frunge(t=10, param=c(r=0.1,k=100), y0=3, Dfdt = dfdt, dt = 0.01, graph = TRUE)




