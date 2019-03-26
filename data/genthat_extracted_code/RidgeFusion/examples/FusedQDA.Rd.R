library(RidgeFusion)


### Name: FusedQDA
### Title: Quadratic Discriminant Analysis with Ridge Fused Inverse
###   Covariance Estimation
### Aliases: FusedQDA
### Keywords: Quadratic Discriminant Analysis

### ** Examples

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
Z=list(X1,Y)
A2=FusedQDA(Z,10,10,scale=TRUE)
names(A2)



