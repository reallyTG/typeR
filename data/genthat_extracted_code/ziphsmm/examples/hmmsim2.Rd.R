library(ziphsmm)


### Name: hmmsim2
### Title: Simulate a hidden Markov series and its underlying states with
###   covariates
### Aliases: hmmsim2

### ** Examples

## Not run: 
##D priorparm <- 0
##D tpmparm <- c(0,-0.5,0.5,0,-0.2,0.8)
##D zeroindex <- c(1,0)
##D zeroparm <- c(0,-1,1)
##D emitparm <- c(2,0.5,-0.5,3,0.3,-0.2)
##D workparm <- c(priorparm,tpmparm,zeroparm,emitparm)
##D 
##D designx <- matrix(rnorm(2000),nrow=1000,ncol=2)
##D result <- hmmsim2(workparm,2,1000,zeroindex,tpm_x=designx,
##D       emit_x=designx,zeroinfl_x=designx)
##D 
##D y <- result$series
##D 
##D prior_init <- c(0.5,0.5)
##D emit_init <- c(10,30)
##D zero_init <- c(0.6,0)
##D omega <- matrix(c(0.9,0.1,0.2,0.8),2,2,byrow=TRUE)
##D 
##D 
##D fit <-  hmmfit(y,NULL,2,prior_init,omega,
##D      emit_init,zero_init, emit_x=designx,zeroinfl_x=designx,
##D      tpm_x=designx,hessian=FALSE,
##D      method="Nelder-Mead", control=list(maxit=2000,trace=1))
##D 
##D decode <- hmmviterbi2(y,NULL,2,fit$working_parameters,zero_init=c(1,0),
##D             emit_x=designx,zeroinfl_x=designx, tpm_x=designx,
##D             plot=TRUE, xlab="time", ylab="count",
##D             xlim=c(0,360),ylim=c(0,200))
##D 
##D sum(decode!=result$state)
## End(Not run)




