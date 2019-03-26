library(bootSVD)


### Name: reindexMatricesByK
### Title: Used for calculation of low dimensional standard errors &
###   percentiles, by re-indexing the A^b by PC index (k) rather than
###   bootstrap index (b).
### Aliases: reindexMatricesByK

### ** Examples

#use small n, small B, for a quick illustration
set.seed(0)
Y<-simEEG(n=100, centered=TRUE, wide=TRUE)
svdY<-fastSVD(Y)
V<- svdY$v #original sample PCs
DUt<- tcrossprod(diag(svdY$d),svdY$u)
bInds<-genBootIndeces(B=50,n=dim(DUt)[2])
bootSVD_LD_output<-bootSVD_LD(DUt=DUt,bInds=bInds,K=3,verbose=interactive())

########
# to get 'low dimensional PC' moments and lower percentiles
AsByB<-bootSVD_LD_output$As
AsByK<-reindexMatricesByK(AsByB)

meanA1<-	apply(AsByK[[1]],2,mean)
seA1<-	apply(AsByK[[1]],2,sd)
pA1<-	apply(AsByK[[1]],2,function(x) quantile(x,.05))
#can also use lapply to get a list (indexed by k=1,...K) of
#the means, standard errors, or percentiles for each PC.
#See example below, for high dimensional bootstrap PCs.

#Alternatively, moments can be calculated with
seA1_v2<- getMomentsAndMomentCI(As=AsByK,
		V=diag(dim(AsByK[[1]])[2]))$sdPCs[[1]]
all(seA1_v2==seA1)

#Additional examples of exploring the low dimensional bootstrap
#PC distribution are given in the documentation for
#the 'bootSVD' function.
#########

#########
#High dimensional percentiles for each PC
VsByB<-As2Vs(As=AsByB,V=V)
VsByK<-reindexMatricesByK(VsByB)
percentileCI_Vs<-lapply(VsByK,function(mat_k){
	apply(mat_k,2,function(x) quantile(x,c(.025,.975)))
})
k=2 # the 2nd PC is a little more interesting here.
matplot(t(percentileCI_Vs[[k]]),type='l',lty=1,col='blue')
lines(V[,k])
########

# Note: This function can also be used to reorganize the
#   high dimensional PCs. For 'ff' matrices, this will
#   create a new set of files on disk.



