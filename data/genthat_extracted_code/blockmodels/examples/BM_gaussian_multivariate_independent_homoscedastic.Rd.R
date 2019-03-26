library(blockmodels)


### Name: BM_gaussian_multivariate_independent_homoscedastic
### Title: Perform estimation on blockmodels for multivariate independent
###   homoscedastic gaussian probability distribution
### Aliases: BM_gaussian_multivariate_independent_homoscedastic
###   \S4method{BM_gaussian_multivariate_independent_homoscedastic}{new}

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
##D Mu1<-4*matrix(runif(Q*Q),Q,Q)
##D Mu2<-4*matrix(runif(Q*Q),Q,Q)
##D M1<-matrix(rnorm(n*n,sd=5),n,n)+Z%*%Mu1%*%t(Z) ## adjacency
##D M2<-matrix(rnorm(n*n,sd=5),n,n)+Z%*%Mu2%*%t(Z) ## adjacency
##D 
##D ## estimation
##D my_model <- BM_gaussian_multivariate_independent_homoscedastic("SBM",list(M1,M2) )
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
##D Mu1<-4*matrix(runif(Q*Q),Q,Q)
##D Mu2<-4*matrix(runif(Q*Q),Q,Q)
##D Mu1[lower.tri(Mu1)]<-t(Mu1)[lower.tri(Mu1)]
##D Mu2[lower.tri(Mu2)]<-t(Mu2)[lower.tri(Mu2)]
##D M1<-matrix(rnorm(n*n,sd=5),n,n)+Z%*%Mu1%*%t(Z) ## adjacency
##D M2<-matrix(rnorm(n*n,sd=5),n,n)+Z%*%Mu2%*%t(Z) ## adjacency
##D M1[lower.tri(M1)]<-t(M1)[lower.tri(M1)]
##D M2[lower.tri(M2)]<-t(M2)[lower.tri(M2)]
##D 
##D ## estimation
##D my_model <- BM_gaussian_multivariate_independent_homoscedastic("SBM_sym",list(M1,M2) )
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
##D Mu1<-4*matrix(runif(Q[1]*Q[2]),Q[1],Q[2])
##D Mu2<-4*matrix(runif(Q[1]*Q[2]),Q[1],Q[2])
##D M1<-matrix(rnorm(n[1]*n[2],sd=5),n[1],n[2])+Z1%*%Mu1%*%t(Z2) ## adjacency
##D M2<-matrix(rnorm(n[1]*n[2],sd=5),n[1],n[2])+Z1%*%Mu2%*%t(Z2) ## adjacency
##D 
##D ## estimation
##D my_model <- BM_gaussian_multivariate_independent_homoscedastic("LBM",list(M1,M2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
## End(Not run)


