library(refund)


### Name: peer
### Title: Construct a PEER regression term in a 'pfr' formula
### Aliases: peer

### ** Examples


## Not run: 
##D #------------------------------------------------------------------------
##D # Example 1: Estimation with D2 penalty
##D #------------------------------------------------------------------------
##D 
##D data(DTI)
##D DTI = DTI[which(DTI$case == 1),]
##D fit.D2 = pfr(pasat ~ peer(cca, pentype="D"), data=DTI)
##D plot(fit.D2)
##D 
##D #------------------------------------------------------------------------
##D # Example 2: Estimation with structured penalty (need structural
##D #            information about regression function or predictor function)
##D #------------------------------------------------------------------------
##D 
##D data(PEER.Sim)
##D data(Q)
##D PEER.Sim1<- subset(PEER.Sim, t==0)
##D 
##D # Setting k to max possible value
##D fit.decomp <- pfr(Y ~ peer(W, pentype="Decomp", Q=Q, k=99), data=PEER.Sim1)
##D plot(fit.decomp)
## End(Not run)





