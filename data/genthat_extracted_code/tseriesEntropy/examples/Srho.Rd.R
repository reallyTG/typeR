library(tseriesEntropy)


### Name: Srho
### Title: Entropy Measure Of Serial And Cross Dependence
### Aliases: Srho
### Keywords: ts

### ** Examples


## UNIVARIATE VERSION
x <- as.integer(rbinom(n=20,size=4,prob=0.5))
Srho(x,lag.max=4)

## BIVARIATE VERSION
y <- as.integer(rbinom(n=20,size=4,prob=0.5))
Srho(x,y,lag.max=4)

## EXAMPLE  1: the effect of normalization
## computes the maximum attainable value by correlating x with itself

set.seed(12)
K    <- 5           # number of categories
smax <- 1-1/sqrt(K) # theoretical maximum under the uniform distribution
x    <- as.integer(sample(1:K,size=1e3,replace=TRUE)) # generates the sequence
S    <- Srho(x,x,lag.max=2,nor=FALSE,plot=FALSE)

plot(S,lwd=2,col=4)
abline(h=smax,col=2,lty=2)
text(x=-1,y=0.54,labels=paste("theoretical maximum = ",round(smax,4),sep=""),col=2)
text(x=-1,y=0.45,labels=paste("estimated maximum = ",round(S[3],4),sep=""),col=4)




