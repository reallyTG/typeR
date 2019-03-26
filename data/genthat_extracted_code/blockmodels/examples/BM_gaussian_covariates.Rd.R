library(blockmodels)


### Name: BM_gaussian_covariates
### Title: Perform estimation on blockmodels for gaussian probability
###   distribution with covariates
### Aliases: BM_gaussian_covariates \S4method{BM_gaussian_covariates}{new}

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
##D Mu<-20*matrix(runif(Q*Q),Q,Q)
##D Y1 <- matrix(runif(n*n),n,n)
##D Y2 <- matrix(runif(n*n),n,n)
##D M<-matrix(rnorm(n*n,sd=5),n,n)+Z%*%Mu%*%t(Z)+4.2*Y1-1.6*Y2 ## adjacency matrix
##D 
##D ## estimation
##D my_model <- BM_gaussian_covariates("SBM",M,list(Y1,Y2) )
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
##D Mu<-20*matrix(runif(Q*Q),Q,Q)
##D Mu[lower.tri(Mu)]<-t(Mu)[lower.tri(Mu)]
##D Y1 <- matrix(runif(n*n),n,n)
##D Y2 <- matrix(runif(n*n),n,n)
##D Y1[lower.tri(Y1)]<-t(Y1)[lower.tri(Y1)]
##D Y2[lower.tri(Y2)]<-t(Y2)[lower.tri(Y2)]
##D M<-matrix(rnorm(n*n,sd=5),n,n)+Z%*%Mu%*%t(Z)+4.2*Y1-1.6*Y2 ## adjacency matrix
##D M[lower.tri(M)]<-t(M)[lower.tri(M)]
##D 
##D ## estimation
##D my_model <- BM_gaussian_covariates("SBM_sym",M,list(Y1,Y2) )
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
##D Mu<-20*matrix(runif(Q[1]*Q[2]),Q[1],Q[2])
##D Y1 <- matrix(runif(n[1]*n[2]),n[1],n[2])
##D Y2 <- matrix(runif(n[1]*n[2]),n[1],n[2])
##D M<-matrix(rnorm(n[1]*n[2],sd=5),n[1],n[2])+Z1%*%Mu%*%t(Z2)+4.2*Y1-1.6*Y2 ## adjacency matrix
##D 
##D ## estimation
##D my_model <- BM_gaussian_covariates("LBM",M,list(Y1,Y2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
## End(Not run)


