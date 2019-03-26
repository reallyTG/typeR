library(RidgeFusion)


### Name: RidgeFused
### Title: Ridged Fused Inverse Covariance Matrix Estimation
### Aliases: RidgeFused
### Keywords: Inverse covariance matrix estimation

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
## Creating a list to use as S
S=list(0,0)	
S[[1]]=(99/100)*cov(X1)
S[[2]]=(99/100)*cov(Y)

## Creating the vector of sample sizes
nc2=c(100,100)

## Running RidgeFused scale invariant method for tuning parameters lambda1=1 ,lambda2=2
A=RidgeFused(S,1,2,nc2,scale=TRUE)
A
names(A)



