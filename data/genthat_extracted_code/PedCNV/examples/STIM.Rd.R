library(PedCNV)


### Name: STIM
### Title: Score test with the intensity value
### Aliases: STIM

### ** Examples

# Fit the data under the assumption that there are 3 clusters
asso.fit <- AssoTestProc(signal=signal,fam=fam,envirX=envirX,phi=phi,N=3,varSelection='PC.9')
alpha <- asso.fit$para$alpha
sig2g <- asso.fit$para$sig2g
sig2 <- asso.fit$para$sig2
STIM(envirX=envirX,signal=signal,fam=fam,alpha=alpha,phi=phi,sig2g=sig2g,sig2=sig2)



