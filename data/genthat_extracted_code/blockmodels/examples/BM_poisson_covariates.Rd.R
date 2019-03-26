library(blockmodels)


### Name: BM_poisson_covariates
### Title: Perform estimation on blockmodels for poisson probability
###   distribution aith covariates
### Aliases: BM_poisson_covariates \S4method{BM_poisson_covariates}{new}

### ** Examples
## Not run: 
##D 
##D ##
##D ## SBM
##D ##
##D 
##D ## generation of one SBM network
##D npc <- 30 # nodes per class
##D Q <- 3 # classes
##D n <- npc * Q # nodes
##D Z<-diag(Q)%x%matrix(1,npc,1)
##D L<-70*matrix(runif(Q*Q),Q,Q)
##D M_in_expectation_without_covariates<-Z%*%L%*%t(Z)
##D Y1 <- matrix(runif(n*n),n,n)
##D Y2 <- matrix(runif(n*n),n,n)
##D M_in_expectation<-M_in_expectation_without_covariates*exp(4.2*Y1-1.2*Y2)
##D M<-matrix(
##D     rpois(
##D         length(as.vector(M_in_expectation)),
##D         as.vector(M_in_expectation))
##D     ,n,n)
##D 
##D ## estimation
##D my_model <- BM_poisson_covariates("SBM",M,list(Y1,Y2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
##D 
##D ##
##D ## SBM symmetric
##D ##
##D 
##D ## generation of one SBM_sym network, we re-use one produced for SBM
##D npc <- 30 # nodes per class
##D Q <- 3 # classes
##D n <- npc * Q # nodes
##D Z<-diag(Q)%x%matrix(1,npc,1)
##D L<-70*matrix(runif(Q*Q),Q,Q)
##D L[lower.tri(L)]<-t(L)[lower.tri(L)]
##D M_in_expectation_without_covariates<-Z%*%L%*%t(Z)
##D Y1 <- matrix(runif(n*n),n,n)
##D Y2 <- matrix(runif(n*n),n,n)
##D Y1[lower.tri(Y1)]<-t(Y1)[lower.tri(Y1)]
##D Y2[lower.tri(Y2)]<-t(Y2)[lower.tri(Y2)]
##D M_in_expectation<-M_in_expectation_without_covariates*exp(4.2*Y1-1.2*Y2)
##D M<-matrix(
##D     rpois(
##D         length(as.vector(M_in_expectation)),
##D         as.vector(M_in_expectation))
##D     ,n,n)
##D M[lower.tri(M)]<-t(M)[lower.tri(M)]
##D 
##D ## estimation
##D my_model <- BM_poisson_covariates("SBM_sym",M,list(Y1,Y2) )
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
##D M_in_expectation_without_covariates<-Z1%*%L%*%t(Z2)
##D Y1 <- matrix(runif(n[1]*n[2]),n[1],n[2])
##D Y2 <- matrix(runif(n[1]*n[2]),n[1],n[2])
##D M_in_expectation<-M_in_expectation_without_covariates*exp(4.2*Y1-1.2*Y2)
##D M<-matrix(
##D     rpois(
##D         length(as.vector(M_in_expectation)),
##D         as.vector(M_in_expectation))
##D     ,n[1],n[2])
##D 
##D ## estimation
##D my_model <- BM_poisson_covariates("LBM",M,list(Y1,Y2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
## End(Not run)


