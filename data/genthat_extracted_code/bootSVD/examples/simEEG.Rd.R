library(bootSVD)


### Name: simEEG
### Title: Simulation functional EEG data
### Aliases: simEEG

### ** Examples

set.seed(0)

#Low noise example, for an illustration of smoother functions
Y<-simEEG(n=20,centered=FALSE,propVarNoise=.02,wide=FALSE)
matplot(Y,type='l',lty=1)

#Higher noise example, for PCA
Y<-simEEG(n=100,centered=TRUE,propVarNoise=.5,wide=TRUE)
svdY<-fastSVD(Y)
V<-svdY$v #since Y is wide, the PCs are the right singular vectors (svd(Y)$v).
d<-svdY$d
head(cumsum(d^2)/sum(d^2),5) #first 5 PCs explain about half the variation

# Compare fitted PCs to true, generating basis vectors
# Since PCs have arbitrary sign, we match the sign of
# the fitted sample PCs to the population PCs first
V_sign_adj<- array(NA,dim=dim(V))
for(i in 1:5){
	V_sign_adj[,i]<-V[,i] * sign(crossprod(V[,i],EEG_leadingV[,i]))
}
par(mfrow=c(1,2))
matplot(V_sign_adj[,1:5],type='l',lty=1,
		main='PCs from simulated data,\n sign adjusted')
matplot(EEG_leadingV,type='l',lty=1,main='Population PCs')



