library(VHDClassification)


### Name: getLogLikeRatio
### Title: Get the log-likelihood ratio from a binary rule (QuadraticRule
###   or LinearRule)
### Aliases: getLogLikeRatio
### Keywords: discrimination

### ** Examples

p=100; n=20 ; mu=array(0,c(p,4)); mu[1:10,1]=2 ;mu[11:20,2]=2;C=array(c(1,20),p)
mu[21:30,3]=2
x=NULL; y=NULL;
for (k in 1:4){
    x=rbind(x,t(array(C^(1/2),c(p,n))*(matrix(rnorm(p*n),nrow=p,ncol=n))+array(mu[,k],c(p,n))));
    y=c(y,array(k,n))}
#Learning
LearnedLinearPartitionWithLLR=learnPartitionWithLLR(x,y,procedure='FDRThresh')

Rule=getBinaryRule(LearnedLinearPartitionWithLLR,1,2)
LLR=getLogLikeRatio(Rule)
print(LLR)


