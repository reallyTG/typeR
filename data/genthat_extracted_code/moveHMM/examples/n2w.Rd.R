library(moveHMM)


### Name: n2w
### Title: Scaling function: natural to working parameters.
### Aliases: n2w

### ** Examples

## Not run: 
##D nbStates <- 3
##D par <- c(0.001,0.999,0.5,0.001,1500.3,7.1)
##D bounds <- matrix(c(0,1, # bounds for first parameter
##D                    0,1, # bounds for second parameter
##D                    0,1, # ...
##D                    0,Inf,
##D                    0,Inf,
##D                    0,Inf),
##D                  byrow=TRUE,ncol=2)
##D beta <- matrix(rnorm(18),ncol=6,nrow=3)
##D delta <- c(0.6,0.3,0.1)
##D 
##D # vector of working parameters
##D wpar <- n2w(par=par,bounds=bounds,beta=beta,delta=delta,nbStates=nbStates,
##D            estAngleMean=FALSE)
## End(Not run)




