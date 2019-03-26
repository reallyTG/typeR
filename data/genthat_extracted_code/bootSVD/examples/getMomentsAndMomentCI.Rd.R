library(bootSVD)


### Name: getMomentsAndMomentCI
### Title: Calculate bootstrap moments and moment-based confidence
###   intervals for the PCs.
### Aliases: getMomentsAndMomentCI

### ** Examples

#use small n, small B, for a quick illustration
set.seed(0)
Y<-simEEG(n=100, centered=TRUE, wide=TRUE)
svdY<-fastSVD(Y)
V<-svdY$v #right singular vectors of the wide matrix Y
DUt<- tcrossprod(diag(svdY$d),svdY$u)
bInds<-genBootIndeces(B=50,n=dim(DUt)[2])
bootSVD_LD_output<-bootSVD_LD(DUt=DUt,bInds=bInds,K=3,verbose=interactive())

AsByB<-bootSVD_LD_output$As
AsByK<-reindexMatricesByK(AsByB)
moments<-getMomentsAndMomentCI(AsByK,V,verbose=interactive())
plot(V[,1],type='l',ylim=c(-.1,.1),main='Original PC1, with CI in blue')
matlines(moments$momentCI[[1]],col='blue',lty=1)

#Can also use this function to get moments for low dimensional
#vectors A^b[,k], by setting V to the identity matrix.
moments_A<- getMomentsAndMomentCI(As=AsByK,V=diag(ncol(AsByK[[1]])))



