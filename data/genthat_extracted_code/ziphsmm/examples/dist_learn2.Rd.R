library(ziphsmm)


### Name: dist_learn2
### Title: Distributed learning for a longitudinal continuous-time
###   zero-inflated Poisson hidden Markov model, where zero-inflation only
###   happens in State 1 and covariates are for state-dependent zero
###   proportion and means. Assume that priors, transition rates,
###   state-dependent intercepts and slopes can be subject-specific,
###   clustered by group, or common. But at least one set of the parameters
###   have to be common across all subjects.
### Aliases: dist_learn2

### ** Examples

## Not run: 
##D set.seed(12933)
##D nsubj <- 20
##D ns <- 4000
##D ylist <- vector(mode="list",length=nsubj)
##D xlist <- vector(mode="list",length=nsubj)
##D timelist <- vector(mode="list",length=nsubj)
##D 
##D priorparm1 <- 0
##D priorparm2 <- 1
##D tpmparm1 <- c(-2,-2)
##D tpmparm2 <- c(0,0)
##D zeroparm <- c(-2,0)
##D emitparm <- c(4,0, 6,0)
##D zeroindex <- c(1,0)
##D for(n in 1:nsubj){
##D  
##D  xlist[[n]] <- matrix(rep(c(0,1,0,1),rep(1000,4)),nrow=4000,ncol=1)
##D  
##D  timeindex <- rep(1,4000)
##D  for(i in 2:4000) timeindex[i] <- timeindex[i-1] + sample(1:4,1)
##D  timelist[[n]] <- timeindex
##D  
##D  if(n<=10){
##D    workparm <- c(priorparm1,tpmparm1,zeroparm,emitparm)
##D  }else{
##D    workparm <- c(priorparm2,tpmparm2,zeroparm,emitparm)
##D  }
##D  
##D  result <- hmmsim2.cont(workparm,2,4000,zeroindex,emit_x=xlist[[n]],
##D                         zeroinfl_x=xlist[[n]],timeindex=timeindex)
##D  ylist[[n]] <- result$series
##D }
##D 
##D prior_init=c(0.5,0.5)
##D tpm_init=matrix(c(-0.1,0.1,0.1,-0.1),2,2,byrow=TRUE)
##D zero_init=0.2
##D emit_init=c(50,400)
##D 
##D ####
##D M <- 2
##D priorclust <- c(rep(1,10),rep(2,10))
##D tpmclust <- c(rep(1,10),rep(2,10))
##D zeroclust <- NULL
##D emitclust <- NULL
##D slopeclust <- rep(1,20)
##D 
##D group <- vector(mode="list",length=2)
##D group[[1]] <- 1:10; group[[2]] <- 11:20
##D ###
##D time <- proc.time()
##D result <- dist_learn2(ylist, xlist, timelist, prior_init, tpm_init, 
##D                      emit_init, zero_init, NULL, rho=1, priorclust,tpmclust,
##D                      emitclust,zeroclust,slopeclust,group,ncores=1,
##D                      maxit=10, tol=1e-4, method="CG",print=TRUE)
##D proc.time() - time
## End(Not run)



