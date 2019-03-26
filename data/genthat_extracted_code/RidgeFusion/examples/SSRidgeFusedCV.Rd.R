library(RidgeFusion)


### Name: SSRidgeFusedCV
### Title: Tuning Parameter Selection For Semi-Supervised Ridge Fusion
###   Model Based Clustering via EM Validation Likelihood
### Aliases: SSRidgeFusedCV
### Keywords: EM Validation Likelihood

### ** Examples

## Not run: 
##D ## Creating a toy example with 5 variables
##D library(mvtnorm)
##D set.seed(526)
##D p=5
##D     Sig1=matrix(0,p,p)
##D 	for(j in 1:p){
##D 		for(i in j:p){          
##D             Sig1[j,i]=.7^abs(i-j)
##D             Sig1[i,j]=Sig1[j,i]
##D             
##D 		}
##D 	}
##D     Sig2=diag(c(rep(2,p-5),rep(1,5)),p,p)##D 
##D X1=rmvnorm(100,rep(2*log(p)/p,p),Sig1)
##D Y=rmvnorm(100,,Sig2)
##D 
##D ## Creating a list of the data for each class
##D Z=list(X1,Y)
##D 
##D ##Creating Unlabeled data set
##D Z1=rmvnorm(250,rep(2*log(p)/p,p),Sig1)
##D Z2=rmvnorm(250,,Sig2)
##D ZU=rbind(Z1,Z2)
##D 
##D Samp=list(0,0)
##D Samp[[1]]=sample(1:100)
##D Samp[[2]]=sample(1:100)
##D 
##D ## Creating Fold list
##D Fold1=list(0,0)
##D for(i in 1:5){
##D 	Fold1[[i]]=list(0,0)
##D 	for(j in 1:2){
##D 		Fold1[[i]][[j]]=Samp[[j]][((20*(i-1))+1):(i*20)]
##D 	}
##D }
##D 
##D 
##D ## Creating Validation sets for unlabeled data
##D SampU=sample(1:500)
##D FoldU1=list(0,0)
##D for(i in 1:5){
##D 	FoldU1[[i]]=SampU[((100*(i-1)+1)):(i*100)]
##D }
##D 
##D 
##D Hello=SSRidgeFusedCV(Z,ZU,10^(-2:-1),10^(-3:1),Fold1,FoldU1,scaleCV=FALSE)
## End(Not run)



