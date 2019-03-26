library(ziphsmm)


### Name: dist_learn
### Title: Distributed learning for a longitudinal continuous-time
###   zero-inflated Poisson hidden Markov model, where zero-inflation only
###   happens in State 1. Assume that priors, transition rates and
###   state-dependent parameters can be subject-specific, clustered by
###   group, or common. But at least one set of the parameters have to be
###   common across all subjects.
### Aliases: dist_learn

### ** Examples

## Not run: 
##D set.seed(930518)
##D nsubj <- 10
##D ns <- 5040
##D ylist <- vector(mode="list",length=nsubj)
##D timelist <- vector(mode="list",length=nsubj)
##D prior1 <- c(0.5,0.2 ,0.3 )
##D omega1 <- matrix(c(-0.3,0.2,0.1,
##D                   0.1,-0.2,0.1,
##D                   0.15,0.2,-0.35),3,3,byrow=TRUE)
##D prior2 <- c(0.3,0.3 ,0.4 )
##D omega2 <- matrix(c(-0.5,0.25,0.25,
##D                    0.2,-0.4,0.2,
##D                    0.15,0.3,-0.45),3,3,byrow=TRUE)
##D emit <- c(50,200,600)
##D zero <- c(0.2,0,0)
##D for(n in 1:nsubj){
##D  timeindex <- rep(1,ns)
##D  for(i in 2:ns) timeindex[i] <- timeindex[i-1] + sample(1:4,1)
##D  timelist[[n]] <- timeindex
##D  if(n<=5){
##D    result <- hmmsim.cont(ns, 3, prior1, omega1, emit, zero, timeindex)
##D    ylist[[n]] <- result$series
##D  }else{
##D    result <- hmmsim.cont(ns, 3, prior2, omega2, emit, zero, timeindex)
##D    ylist[[n]] <- result$series
##D  }
##D }
##D prior_init <- c(0.5,0.2,0.3)
##D emit_init <- c(50, 225, 650)
##D zero_init <- 0.2
##D tpm_init <- matrix(c(-0.3,0.2,0.1,0.1,-0.2,0.1,0.15,0.2,-0.35),3,3,byrow=TRUE)
##D M <- 3
##D priorclust <- NULL
##D tpmclust <- c(1,1,1,1,1,2,2,2,2,2)
##D zeroclust <- rep(1,10)
##D emitclust <- rep(1,10)
##D group <- vector(mode="list",length=2)
##D group[[1]] <- 1:5; group[[2]] <- 6:10
##D result <- dist_learn(ylist, timelist, prior_init, tpm_init, 
##D                     emit_init, zero_init,NULL, rho=1,priorclust,tpmclust,
##D                     emitclust,zeroclust,group,ncores=1,
##D                     maxit=50, tol=1e-4, method="CG", print=TRUE)
## End(Not run)



