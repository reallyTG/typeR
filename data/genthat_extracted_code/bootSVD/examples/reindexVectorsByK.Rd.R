library(bootSVD)


### Name: reindexVectorsByK
### Title: Used to study of the bootstrap distribution of the k^th singular
###   values, by re-indexing the list of d^b vectors to be organized by PC
###   index (k) rather than bootstrap index (b).
### Aliases: reindexVectorsByK

### ** Examples

#use small n, small B, for a quick illustration
set.seed(0)
Y<-simEEG(n=100, centered=TRUE, wide=TRUE)
svdY<-fastSVD(Y)
DUt<- tcrossprod(diag(svdY$d),svdY$u)
bInds<-genBootIndeces(B=50,n=dim(DUt)[2])
bootSVD_LD_output<-bootSVD_LD(DUt=DUt,bInds=bInds,K=3,verbose=interactive())

dsByK<-reindexVectorsByK(bootSVD_LD_output$ds)

boxplot(dsByK[[1]],main='Bootstrap distribution of 1st singular value')



