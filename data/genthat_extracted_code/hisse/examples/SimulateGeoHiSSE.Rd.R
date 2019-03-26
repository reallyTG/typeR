library(hisse)


### Name: SimulateGeoHiSSE
### Title: Simulate under a GeoHiSSE model
### Aliases: SimulateGeoHiSSE
### Keywords: simulation, GeoSSE, GeoHiSSE

### ** Examples

## Not run: 
##D ## Get the a list with the correct parameters to run the simulation:
##D pars <- SimulateGeoHiSSE(hidden.areas=1, return.GeoHiSSE_pars=TRUE)
##D ## Edit the parameter values:
##D pars$model.pars[1:3,] <- 0.1
##D pars$model.pars[4:5,] <- 0.05
##D pars$model.pars[6:7,] <- 0.01
##D pars$q.01[1,2] <- pars$q.01[2,1] <- 0.01
##D pars$q.1[1,2] <- pars$q.1[2,1] <- 0.02
##D pars$q.2[1,2] <- pars$q.2[2,1] <- 0.02
##D ## Run the simulation:
##D sim <- SimulateGeoHiSSE(pars=pars, hidden.areas=1, x0="01A", max.taxa=100)
## End(Not run)



