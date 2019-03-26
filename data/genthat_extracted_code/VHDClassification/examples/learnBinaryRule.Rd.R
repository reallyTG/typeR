library(VHDClassification)


### Name: learnBinaryRule
### Title: Function to learn a binary classification rule
### Aliases: learnBinaryRule

### ** Examples

p=100; n=50 ; mu=array(0,c(p,2)); mu[1:10,1]=1 ;C=array(c(1,20),p)
x=NULL; y=NULL;

for (k in 1:2){    
  M=matrix(rnorm(p*n),nrow=p,ncol=n)
  x=rbind(x,t(array(C^(1/2),c(p,n))*(M)+array(mu[,k],c(p,n))));
    y=c(y,array(k,n))    }
#Learning
LearnedBinaryRule=learnBinaryRule(x,y)
show(LearnedBinaryRule)


