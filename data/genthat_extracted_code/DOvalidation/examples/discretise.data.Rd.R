library(DOvalidation)


### Name: discretise.data
### Title: Aggregate data in the form of occurrences and exposures
### Aliases: discretise.data
### Keywords: nonparametric survival

### ** Examples

## A simple example with right censored data
Zi<-c(3,6,7,7,8,10,11,11,11,12,13,13,14,16,20,20,22,32,34,36)
n<-length(Zi)
Li<-deltai<-rep(0,n) 
ind.cens<-c(1,3,4,8,9,13,14,15,16)
deltai[-ind.cens]<-1
## Obtain the occurrences and exposures for a grid of 6 time points
res<-discretise.data(Li,Zi,deltai,M=6)
## Now calculate the local linear hazard estimator
hazard.LL(res$xi,res$Oi,res$Ei,res$xi,b=10)



