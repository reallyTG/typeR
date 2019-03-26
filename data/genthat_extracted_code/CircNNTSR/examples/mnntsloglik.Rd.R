library(CircNNTSR)


### Name: mnntsloglik
### Title: MNNTS log-likelihood function
### Aliases: mnntsloglik

### ** Examples

M<-c(2,3)
R<-length(M)
data<-c(0,pi,pi/2,pi,pi,3*pi/2,pi,2*pi,2*pi,pi)
data<-matrix(data,ncol=2,byrow=TRUE)
data
ccoef<-mnntsrandominitial(M,R)
mnntsdensity(data,ccoef,M,R)
mnntsloglik(data,ccoef,M,R)



