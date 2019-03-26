library(blockmodels)


### Name: BM_bernoulli
### Title: Perform estimation on blockmodels for bernoulli probability
###   distribution
### Aliases: BM_bernoulli \S4method{BM_bernoulli}{new}

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
##D P<-matrix(runif(Q*Q),Q,Q)
##D M<-1*(matrix(runif(n*n),n,n)<Z%*%P%*%t(Z)) ## adjacency matrix
##D 
##D ## estimation
##D my_model <- BM_bernoulli("SBM",M )
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
##D P<-matrix(runif(Q*Q),Q,Q)
##D P[lower.tri(P)]<-t(P)[lower.tri(P)]
##D M<-1*(matrix(runif(n*n),n,n)<Z%*%P%*%t(Z)) ## adjacency matrix
##D M[lower.tri(M)]<-t(M)[lower.tri(M)]
##D 
##D ## estimation
##D my_model <- BM_bernoulli("SBM_sym",M )
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
##D P<-matrix(runif(Q[1]*Q[2]),Q[1],Q[2])
##D M<-1*(matrix(runif(n[1]*n[2]),n[1],n[2])<Z1%*%P%*%t(Z2)) ## adjacency matrix
##D 
##D ## estimation
##D my_model <- BM_bernoulli("LBM",M )
##D my_model$estimate()
##D which.max(my_model$ICL)
## End(Not run)


