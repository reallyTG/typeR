library(moveHMM)


### Name: nLogLike
### Title: Negative log-likelihood function
### Aliases: nLogLike

### ** Examples

## Not run: 
##D # data is a moveData object (as returned by prepData), automatically loaded with the package
##D data <- example$data
##D simPar <- example$simPar
##D par0 <- example$par0
##D 
##D estAngleMean <- is.null(simPar$angleMean)
##D bounds <- parDef(simPar$stepDist,simPar$angleDist,simPar$nbStates,
##D                  estAngleMean,simPar$zeroInflation)$bounds
##D parSize <- parDef(simPar$stepDist,simPar$angleDist,simPar$nbStates,
##D                   estAngleMean,simPar$zeroInflation)$parSize
##D 
##D par <- c(par0$stepPar0,par0$anglePar0)
##D wpar <- n2w(par,bounds,par0$beta0,par0$delta0,simPar$nbStates,FALSE)
##D 
##D l <- nLogLike(wpar=wpar,nbStates=simPar$nbStates,bounds=bounds,parSize=parSize,data=data,
##D              stepDist=simPar$stepDist,angleDist=simPar$angleDist,angleMean=simPar$angleMean,
##D              zeroInflation=simPar$zeroInflation)
## End(Not run)




