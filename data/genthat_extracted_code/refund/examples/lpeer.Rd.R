library(refund)


### Name: lpeer
### Title: Longitudinal Functional Models with Structured Penalties
### Aliases: lpeer

### ** Examples


## Not run: 
##D #------------------------------------------------------------------------
##D # Example 1: Estimation with Ridge penalty
##D #------------------------------------------------------------------------
##D 
##D ##Load Data
##D data(DTI)
##D 
##D ## Extract values for arguments for lpeer() from given data
##D cca = DTI$cca[which(DTI$case == 1),]
##D DTI = DTI[which(DTI$case == 1),]
##D 
##D ##1.1 Fit the model with single component function
##D ##    gamma(t,s)=gamm0(s)
##D t<- DTI$visit
##D fit.cca.lpeer1 = lpeer(Y=DTI$pasat, t=t, subj=DTI$ID, funcs = cca)
##D plot(fit.cca.lpeer1)
##D 
##D ##1.2 Fit the model with two component function
##D ##    gamma(t,s)=gamm0(s) + t*gamma1(s)
##D fit.cca.lpeer2 = lpeer(Y=DTI$pasat, t=t, subj=DTI$ID, funcs = cca,
##D                       f_t=t, se=TRUE)
##D plot(fit.cca.lpeer2)
##D 
##D #------------------------------------------------------------------------
##D # Example 2: Estimation with structured penalty (need structural
##D #            information about regression function or predictor function)
##D #------------------------------------------------------------------------
##D 
##D ##Load Data
##D data(PEER.Sim)
##D 
##D ## Extract values for arguments for lpeer() from given data
##D K<- 100
##D W<- PEER.Sim[,c(3:(K+2))]
##D Y<- PEER.Sim[,K+3]
##D t<- PEER.Sim[,2]
##D id<- PEER.Sim[,1]
##D 
##D ##Load Q matrix containing structural information
##D data(Q)
##D 
##D ##2.1 Fit the model with two component function
##D ##    gamma(t,s)=gamm0(s) + t*gamma1(s)
##D Fit1<- lpeer(Y=Y, subj=id, t=t, covariates=cbind(t), funcs=W,
##D 	    pentype='DECOMP', f_t=cbind(1,t), Q=Q, se=TRUE)
##D 
##D Fit1$Beta
##D plot(Fit1)
##D 
##D ##2.2 Fit the model with three component function
##D ##    gamma(t,s)=gamm0(s) + t*gamma1(s) + t^2*gamma1(s)
##D Fit2<- lpeer(Y=Y, subj=id, t=t, covariates=cbind(t), funcs=W,
##D 		     pentype='DECOMP', f_t=cbind(1,t, t^2), Q=Q, se=TRUE)
##D 
##D Fit2$Beta
##D plot(Fit2)
##D 
##D ##2.3 Fit the model with two component function with different penalties
##D ##    gamma(t,s)=gamm0(s) + t*gamma1(s)
##D Q1<- cbind(Q, Q)
##D Fit3<- lpeer(Y=Y, subj=id, t=t, covariates=cbind(t), comm.pen=FALSE, funcs=W,
##D 		     pentype='DECOMP', f_t=cbind(1,t), Q=Q1, se=TRUE)
##D 
##D ##2.4 Fit the model with two component function with user defined penalties
##D ##    gamma(t,s)=gamm0(s) + t*gamma1(s)
##D phia<- 10^3
##D P_Q <- t(Q)%*%solve(Q%*%t(Q))%*% Q
##D L<- phia*(diag(K)- P_Q) + 1*P_Q
##D Fit4<- lpeer(Y=Y, subj=id, t=t, covariates=cbind(t), funcs=W,
##D 		     pentype='USER', f_t=cbind(1,t), L=L, se=TRUE)
##D 
##D L1<- adiag(L, L)
##D Fit5<- lpeer(Y=Y, subj=id, t=t, covariates=cbind(t), comm.pen=FALSE, funcs=W,
##D 		     pentype='USER', f_t=cbind(1,t), L=L1, se=TRUE)
## End(Not run)




