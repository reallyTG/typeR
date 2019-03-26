library(blockmodels)


### Name: BM_bernoulli_multiplex
### Title: Perform estimation on blockmodels for multiplex binary networks
### Aliases: BM_bernoulli_multiplex \S4method{BM_bernoulli_multiplex}{new}

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
##D Q <- 3 # classes
##D n <- npc * Q # nodes
##D Z<-diag(Q)%x%matrix(1,npc,1)
##D P00<-matrix(runif(Q*Q),Q,Q)
##D P10<-matrix(runif(Q*Q),Q,Q)
##D P01<-matrix(runif(Q*Q),Q,Q)
##D P11<-matrix(runif(Q*Q),Q,Q)
##D SumP<-P00+P10+P01+P11
##D P00<-P00/SumP
##D P01<-P01/SumP
##D P10<-P10/SumP
##D P11<-P11/SumP
##D MU<-matrix(runif(n*n),n,n)
##D M1<-1*(MU>Z%*%(P00+P01)%*%t(Z))
##D M2<-1*((MU>Z%*%P00%*%t(Z)) & (MU<Z%*%(P00+P01+P11)%*%t(Z))) ## adjacency matrices
##D 
##D 
##D ## estimation
##D my_model <- BM_bernoulli_multiplex("SBM",list(M1,M2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
##D 
##D ##
##D ## SBM symmetric
##D ##
##D 
##D ## generation of one SBM network
##D npc <- 30 # nodes per class
##D Q <- 3 # classes
##D n <- npc * Q # nodes
##D Z<-diag(Q)%x%matrix(1,npc,1)
##D Q <- 3 # classes
##D n <- npc * Q # nodes
##D Z<-diag(Q)%x%matrix(1,npc,1)
##D P00<-matrix(runif(Q*Q),Q,Q)
##D P10<-matrix(runif(Q*Q),Q,Q)
##D P01<-matrix(runif(Q*Q),Q,Q)
##D P11<-matrix(runif(Q*Q),Q,Q)
##D SumP<-P00+P10+P01+P11
##D P00<-P00/SumP
##D P01<-P01/SumP
##D P10<-P10/SumP
##D P11<-P11/SumP
##D P00[lower.tri(P00)]<-t(P00)[lower.tri(P00)]
##D P01[lower.tri(P01)]<-t(P01)[lower.tri(P01)]
##D P10[lower.tri(P10)]<-t(P10)[lower.tri(P10)]
##D P11[lower.tri(P11)]<-t(P11)[lower.tri(P11)]
##D MU<-matrix(runif(n*n),n,n)
##D MU[lower.tri(MU)]<-t(MU)[lower.tri(MU)]
##D M1<-1*(MU>Z%*%(P00+P01)%*%t(Z))
##D M2<-1*((MU>Z%*%P00%*%t(Z)) & (MU<Z%*%(P00+P01+P11)%*%t(Z))) ## adjacency matrices
##D 
##D 
##D ## estimation
##D my_model <- BM_bernoulli_multiplex("SBM_sym",list(M1,M2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
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
##D Z1<-diag(Q[1])%x%matrix(1,npc[1],1)
##D Z2<-diag(Q[2])%x%matrix(1,npc[2],1)
##D P00<-matrix(runif(Q[1]*Q[2]),Q[1],Q[2])
##D P10<-matrix(runif(Q[1]*Q[2]),Q[1],Q[2])
##D P01<-matrix(runif(Q[1]*Q[2]),Q[1],Q[2])
##D P11<-matrix(runif(Q[1]*Q[2]),Q[1],Q[2])
##D SumP<-P00+P10+P01+P11
##D P00<-P00/SumP
##D P01<-P01/SumP
##D P10<-P10/SumP
##D P11<-P11/SumP
##D MU<-matrix(runif(n[1]*n[2]),n[1],n[2])
##D M1<-1*(MU>Z1%*%(P00+P01)%*%t(Z2))
##D M2<-1*((MU>Z1%*%P00%*%t(Z2)) & (MU<Z1%*%(P00+P01+P11)%*%t(Z2))) ## adjacency matrices
##D 
##D 
##D ## estimation
##D my_model <- BM_bernoulli_multiplex("LBM",list(M1,M2) )
##D my_model$estimate()
##D which.max(my_model$ICL)
## End(Not run)


