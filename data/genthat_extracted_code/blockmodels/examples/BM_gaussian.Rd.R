library(blockmodels)


### Name: BM_gaussian
### Title: Perform estimation on blockmodels for gaussian probability
###   distribution
### Aliases: BM_gaussian \S4method{BM_gaussian}{new}

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
##D M<-matrix(rnorm(n*n,sd=10),n,n)+Z%*%Mu%*%t(Z) ## adjacency matrix
##D 
##D ## estimation
##D my_model <- BM_gaussian("SBM",M )
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
##D M<-matrix(rnorm(n*n,sd=10),n,n)+Z%*%Mu%*%t(Z) ## adjacency matrix
##D M[lower.tri(M)]<-t(M)[lower.tri(M)]
##D 
##D ## estimation
##D my_model <- BM_gaussian("SBM_sym",M )
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
##D M<-matrix(rnorm(n[1]*n[2],sd=10),n[1],n[2])+Z1%*%Mu%*%t(Z2) ## adjacency matrix
##D 
##D ## estimation
##D my_model <- BM_gaussian("LBM",M )
##D my_model$estimate()
##D which.max(my_model$ICL)
## End(Not run)


