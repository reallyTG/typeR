library(ziphsmm)


### Name: dist_learn3
### Title: Distributed learning for a longitudinal continuous-time
###   zero-inflated Poisson hidden Markov model, where zero-inflation only
###   happens in State 1 with covariates in the state-dependent parameters
###   and transition rates.
### Aliases: dist_learn3

### ** Examples

## Not run: 
##D set.seed(12933)
##D nsubj <- 10
##D ns <- 2000
##D ylist <- vector(mode="list",length=nsubj)
##D xlist <- vector(mode="list",length=nsubj)
##D timelist <- vector(mode="list",length=nsubj)
##D 
##D priorparm <- 0
##D tpmparm <- c(-2,0.1,-2,-0.2)
##D zeroindex <- c(1,0)
##D zeroparm <- c(0,0.5)
##D emitparm <- c(2,0.2,3,0.3)
##D workparm <- NULL
##D 
##D for(n in 1:nsubj){
##D  
##D  xlist[[n]] <- matrix(rep(c(0,1),rep(1000,2)),nrow=2000,ncol=1)
##D  
##D  timeindex <- rep(1,2000)
##D  for(i in 2:2000) timeindex[i] <- timeindex[i-1] + sample(1:4,1)
##D  timelist[[n]] <- timeindex
##D    
##D    workparm <- rbind(workparm,c(priorparm,tpmparm,zeroparm,emitparm))
##D  
##D  result <- hmmsim3.cont(workparm,2,2000,zeroindex,x=xlist[[n]],timeindex=timeindex)
##D  ylist[[n]] <- result$series
##D }
##D 
##D 
##D ####
##D M <- 2
##D priorclust <- c(rep(1,5),rep(2,5))
##D tpmclust <- c(rep(1,5),rep(2,5))
##D tpmslopeclust <- c(rep(1,5),rep(2,5))
##D zeroclust <- NULL
##D emitclust <- NULL
##D slopeclust <- rep(1,10)
##D 
##D group <- vector(mode="list",length=2)
##D group[[1]] <- 1:5; group[[2]] <- 6:10
##D ###
##D time <- proc.time()
##D result <- dist_learn3(ylist, xlist, timelist, 2,workparm, 
##D                      NULL, rho=1, priorclust,tpmclust,tpmslopeclust,
##D                      emitclust,zeroclust,slopeclust,group,ncores=1,
##D                      maxit=20, tol=1e-4, method="CG",print=TRUE)
##D proc.time() - time
## End(Not run)



