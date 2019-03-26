library(RidgeFusion)


### Name: RidgeFusedCV
### Title: Ridged Fused Validation Likelihood
### Aliases: RidgeFusedCV
### Keywords: Validation Likelihood

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

## Creating a list of the data for each class
Z=list(X1,Y)

Samp=list(0,0)
Samp[[1]]=sample(1:100)
Samp[[2]]=sample(1:100)

## Creating Fold list
Fold1=list(0,0)
for(i in 1:5){
	Fold1[[i]]=list(0,0)
	for(j in 1:2){
		Fold1[[i]][[j]]=Samp[[j]][((20*(i-1))+1):(i*20)]
	}
}

## Calculating Validation likelihood scores for
##tuning parameter grid 10^(-1:1) for Ridge, and 10^(2:3) for Ridge Fusion
Tell=RidgeFusedCV(Z,10^(-1:1),10^(2:3),Fold1,scaleCV=TRUE)
Tell
names(Tell)



