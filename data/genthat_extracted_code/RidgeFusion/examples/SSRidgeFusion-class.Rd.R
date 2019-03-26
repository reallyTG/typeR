library(RidgeFusion)


### Name: SSRidgeFusion-class
### Title: Class '"SSRidgeFusion"'
### Aliases: SSRidgeFusion-class SSRidgeFusion predict,SSRidgeFusion-method
###   print,SSRidgeFusion-method predict.SSRidgeFusion
### Keywords: classes

### ** Examples

showClass("SSRidgeFusion")
## Creating a toy example with 5 variables
library(mvtnorm)
set.seed(526)
p=5
    Sig1=matrix(0,p,p)
	for(j in 1:p){
		for(i in j:p){          
            Sig1[j,i]=.7^abs(i-j)
            Sig1[i,j]=Sig1[j,i]
            
		}
	}
    Sig2=diag(c(rep(2,p-5),rep(1,5)),p,p)
X1=rmvnorm(100,rep(2*log(p)/p,p),Sig1)
Y=rmvnorm(100,,Sig2)

## Creating a list of the data for each class
Z=list(X1,Y)

##Creating Unlabeled data set
Z1=rmvnorm(250,rep(2*log(p)/p,p),Sig1)
Z2=rmvnorm(250,,Sig2)
ZU=rbind(Z1,Z2)
## Running Semi-Supervised Ridge Fused Model based clustering 
Hi=SSRidgeFused(Z,ZU,1,1,Scale=TRUE,warm=NULL)
Class=predict(Hi,Z1,class=TRUE)
Score=predict(Hi,Z1,class=FALSE)



