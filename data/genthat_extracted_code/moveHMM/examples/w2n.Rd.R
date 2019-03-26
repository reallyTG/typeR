library(moveHMM)


### Name: w2n
### Title: Scaling function: working to natural parameters
### Aliases: w2n

### ** Examples

## Not run: 
##D nbStates <- 3
##D nbCovs <- 2
##D par <- c(0.001,0.999,0.5,0.001,1500.3,7.1)
##D parSize <- c(1,1)
##D bounds <- matrix(c(0,1,0,1,0,1,
##D                    0,Inf,0,Inf,0,Inf),
##D                  byrow=TRUE,ncol=2)
##D beta <- matrix(rnorm(18),ncol=6,nrow=3)
##D delta <- c(0.6,0.3,0.1)
##D wpar <- n2w(par,bounds,beta,delta,nbStates,FALSE)
##D print(w2n(wpar,bounds,parSize,nbStates,nbCovs,estAngleMean=FALSE,stationary=FALSE))
## End(Not run)





