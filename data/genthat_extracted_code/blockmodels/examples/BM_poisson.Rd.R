library(blockmodels)


### Name: BM_poisson
### Title: Perform estimation on blockmodels for poisson probability
###   distribution
### Aliases: BM_poisson \S4method{BM_poisson}{new}

### ** Examples
## Not run: 
##D 
##D #
##D # SBM
##D #
##D 
##D ## generation of one SBM network
##D npc <- 30 # nodes per class
##D Q <- 3 # classes
##D n <- npc * Q # nodes
##D Z<-diag(Q)%x%matrix(1,npc,1)
##D L<-70*matrix(runif(Q*Q),Q,Q)
##D M_in_expectation<-Z%*%L%*%t(Z)
##D M<-matrix(
##D     rpois(
##D         length(as.vector(M_in_expectation)),
##D         as.vector(M_in_expectation))
##D     ,n,n)
##D 
##D ## estimation
##D my_model <- BM_poisson("SBM",M )
##D my_model$estimate()
##D which.max(my_model$ICL)
##D 
##D ##
##D ## SBM symmetric
##D ##
##D 
##D ## generation of one SBM_sym network
##D npc <- 30 # nodes per class
##D Q <- 3 # classes
##D n <- npc * Q # nodes
##D Z<-diag(Q)%x%matrix(1,npc,1)
##D L<-70*matrix(runif(Q*Q),Q,Q)
##D L[lower.tri(L)]<-t(L)[lower.tri(L)]
##D M_in_expectation<-Z%*%L%*%t(Z)
##D M<-matrix(
##D     rpois(
##D         length(as.vector(M_in_expectation)),
##D         as.vector(M_in_expectation))
##D     ,n,n)
##D M[lower.tri(M)]<-t(M)[lower.tri(M)]
##D 
##D ## estimation
##D my_model <- BM_poisson("SBM_sym",M )
##D my_model$estimate()
##D which.max(my_model$ICL)
##D 
##D ##
##D ## LBM
##D ##
##D 
##D ## generation of one LBM network
##D npc <- c(50,40) # nodes per class
##D Q <- c(2,3) # classes
##D n <- npc * Q # nodes
##D Z1<-diag(Q[1])%x%matrix(1,npc[1],1)
##D Z2<-diag(Q[2])%x%matrix(1,npc[2],1)
##D L<-70*matrix(runif(Q[1]*Q[2]),Q[1],Q[2])
##D M_in_expectation<-Z1%*%L%*%t(Z2)
##D M<-matrix(
##D     rpois(
##D         length(as.vector(M_in_expectation)),
##D         as.vector(M_in_expectation))
##D     ,n[1],n[2])
##D 
##D ## estimation
##D my_model <- BM_poisson("LBM",M )
##D my_model$estimate()
##D which.max(my_model$ICL)
## End(Not run)


