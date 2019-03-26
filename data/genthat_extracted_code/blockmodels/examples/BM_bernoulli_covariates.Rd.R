library(blockmodels)


### Name: BM_bernoulli_covariates
### Title: Perform estimation on blockmodels for bernoulli probability
###   distribution aith covariates
### Aliases: BM_bernoulli_covariates
###   \S4method{BM_bernoulli_covariates}{new}

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
##D sigmo <- function(x){1/(1+exp(-x))}
##D Z<-diag(Q)%x%matrix(1,npc,1)
##D Mg<-8*matrix(runif(Q*Q),Q,Q)-4
##D Y1 <- matrix(runif(n*n),n,n)-.5
##D Y2 <- matrix(runif(n*n),n,n)-.5
##D M_in_expectation<-sigmo(Z%*%Mg%*%t(Z) + 5*Y1-3*Y2)
##D M<-1*(matrix(runif(n*n),n,n)<M_in_expectation)
##D 
##D ## estimation
##D my_model <- BM_bernoulli_covariates("SBM",M,list(Y1,Y2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
##D 
##D 
##D ##
##D ## SBM symmetric
##D ##
##D 
##D ## generation of one SBM_sym network
##D npc <- 30 # nodes per class
##D Q <- 3 # classes
##D n <- npc * Q # nodes
##D sigmo <- function(x){1/(1+exp(-x))}
##D Z<-diag(Q)%x%matrix(1,npc,1)
##D Mg<-8*matrix(runif(Q*Q),Q,Q)-4
##D Mg[lower.tri(Mg)]<-t(Mg)[lower.tri(Mg)]
##D Y1 <- matrix(runif(n*n),n,n)-.5
##D Y2 <- matrix(runif(n*n),n,n)-.5
##D Y1[lower.tri(Y1)]<-t(Y1)[lower.tri(Y1)]
##D Y2[lower.tri(Y2)]<-t(Y2)[lower.tri(Y2)]
##D M_in_expectation<-sigmo(Z%*%Mg%*%t(Z) + 5*Y1-3*Y2)
##D M<-1*(matrix(runif(n*n),n,n)<M_in_expectation)
##D M[lower.tri(M)]<-t(M)[lower.tri(M)]
##D 
##D ## estimation
##D my_model <- BM_bernoulli_covariates("SBM_sym",M,list(Y1,Y2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
##D 
##D 
##D 
##D ##
##D ## LBM
##D ##
##D 
##D ## generation of one LBM network
##D npc <- c(50,40) # nodes per class
##D Q <- c(2,3) # classes
##D n <- npc * Q # nodes
##D sigmo <- function(x){1/(1+exp(-x))}
##D Z1<-diag(Q[1])%x%matrix(1,npc[1],1)
##D Z2<-diag(Q[2])%x%matrix(1,npc[2],1)
##D Mg<-8*matrix(runif(Q[1]*Q[2]),Q[1],Q[2])-4
##D Y1 <- matrix(runif(n[1]*n[2]),n[1],n[2])-.5
##D Y2 <- matrix(runif(n[1]*n[2]),n[1],n[2])-.5
##D M_in_expectation<-sigmo(Z1%*%Mg%*%t(Z2) + 5*Y1-3*Y2)
##D M<-1*(matrix(runif(n[1]*n[2]),n[1],n[2])<M_in_expectation)
##D 
##D ## estimation
##D my_model <- BM_bernoulli_covariates("LBM",M,list(Y1,Y2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
## End(Not run)


