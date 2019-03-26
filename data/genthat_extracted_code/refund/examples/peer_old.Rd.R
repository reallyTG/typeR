library(refund)


### Name: peer_old
### Title: Functional Models with Structured Penalties
### Aliases: peer_old

### ** Examples


## Not run: 
##D #------------------------------------------------------------------------
##D # Example 1: Estimation with D2 penalty
##D #------------------------------------------------------------------------
##D 
##D ## Load Data
##D data(DTI)
##D 
##D ## Extract values for arguments for peer() from given data
##D cca = DTI$cca[which(DTI$case == 1),]
##D DTI = DTI[which(DTI$case == 1),]
##D 
##D ##1.1 Fit the model
##D fit.cca.peer1 = peer(Y=DTI$pasat, funcs = cca, pentype='D2', se=TRUE)
##D plot(fit.cca.peer1)
##D 
##D #------------------------------------------------------------------------
##D # Example 2: Estimation with structured penalty (need structural
##D #            information about regression function or predictor function)
##D #------------------------------------------------------------------------
##D 
##D ## Load Data
##D data(PEER.Sim)
##D 
##D ## Extract values for arguments for peer() from given data
##D PEER.Sim1<- subset(PEER.Sim, t==0)
##D W<- PEER.Sim1$W
##D Y<- PEER.Sim1$Y
##D 
##D ##Load Q matrix containing structural information
##D data(Q)
##D 
##D ##2.1 Fit the model
##D Fit1<- peer(Y=Y, funcs=W, pentype='Decomp', Q=Q, se=TRUE)
##D plot(Fit1)
## End(Not run)




