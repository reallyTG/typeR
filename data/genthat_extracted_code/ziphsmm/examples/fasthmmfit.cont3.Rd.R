library(ziphsmm)


### Name: fasthmmfit.cont3
### Title: Fast gradient descent algorithm to learn the parameters in a
###   specialized continuous-time zero-inflated hidden Markov model, where
###   zero-inflation only happens in State 1 with covariates in the
###   state-dependent parameters and transition rates.
### Aliases: fasthmmfit.cont3

### ** Examples

## Not run: 
##D priorparm <- 0
##D tpmparm <- c(-2,0.1,-0.1,-2,-0.2,0.2)
##D zeroindex <- c(1,0)
##D zeroparm <- c(0,-1,1)
##D emitparm <- c(2,0.5,-0.5,3,0.3,-0.2)
##D workparm <- c(priorparm,tpmparm,zeroparm,emitparm)
##D timeindex <- rep(1,1000)
##D for(i in 2:1000) timeindex[i] <- timeindex[i-1] + sample(1:4,1)
##D 
##D designx <- matrix(rnorm(2000),nrow=1000,ncol=2)
##D result <- hmmsim3.cont(workparm,2,1000,zeroindex,x=designx,timeindex=timeindex)
##D y <- result$series
##D state <- result$state
##D 
##D fit2 <-  fasthmmfit.cont3(y=y,x=designx,M=2,initparm=workparm,
##D   timeindex=timeindex,
##D   hessian=FALSE, method="BFGS", control=list(trace=1))
## End(Not run)



