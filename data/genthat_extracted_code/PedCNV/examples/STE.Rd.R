library(PedCNV)


### Name: STE
### Title: Score test with the most probable CNV
### Aliases: STE

### ** Examples

# Fit the data under the assumption that there are 3 clusters
asso.fit <- AssoTestProc(signal=signal,fam=fam,envirX=envirX,phi=phi,N=3,varSelection='PC.9')
cnv_e <- asso.fit$clusRes
alpha <- asso.fit$para$alpha
sig2g <- asso.fit$para$sig2g
sig2 <- asso.fit$para$sig2
STE(envirX=envirX,clusRes=cnv_e,fam=fam,alpha=alpha,phi=phi,sig2g=sig2g,sig2=sig2)



