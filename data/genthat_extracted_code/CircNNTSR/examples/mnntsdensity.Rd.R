library(CircNNTSR)


### Name: mnntsdensity
### Title: MNNTS density function
### Aliases: mnntsdensity

### ** Examples

M<-c(2,3)
R<-length(M)
data<-c(0,pi,pi/2,pi,pi,3*pi/2,pi,2*pi,2*pi,pi)
data<-matrix(data,ncol=2,byrow=TRUE)
data
ccoef<-mnntsrandominitial(M,R)
mnntsdensity(data,ccoef,M,R)

M<-c(2,3)
R<-length(M)
data(Nest)
data<-Nest
est<-mnntsmanifoldnewtonestimation(data,M,R,1000)
est
ccoef<-est$cestimates[,3]
mnntsdensity(data,ccoef,M,R)



