library(bootSVD)


### Name: As2Vs
### Title: Convert low dimensional bootstrap components to high dimensional
###   bootstrap components
### Aliases: As2Vs

### ** Examples

#use small n, small B, for a quick illustration
set.seed(0)
Y<-simEEG(n=100, centered=TRUE, wide=TRUE)
svdY<-fastSVD(Y)
DUt<- tcrossprod(diag(svdY$d),svdY$u)
bInds<-genBootIndeces(B=50,n=dim(DUt)[2])
bootSVD_LD_output<-bootSVD_LD(DUt=DUt,bInds=bInds,K=3,verbose=interactive())

Vs<-As2Vs(As=bootSVD_LD_output$As,V=svdY$v)
# Yields the high dimensional bootstrap PCs (left singular
# vectors of the bootstrap sample Y),
# indexed by b = 1,2...B, where B is the number of bootstrap samples



