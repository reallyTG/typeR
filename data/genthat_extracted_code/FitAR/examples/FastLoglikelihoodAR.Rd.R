library(FitAR)


### Name: FastLoglikelihoodAR
### Title: Fast Computation of the Loglikelihood Function in AR
### Aliases: FastLoglikelihoodAR
### Keywords: ts

### ** Examples

#Compute the loglikelihood using the direct method as implemented
# in LoglikelihoodAR and using the fast method
phi<-PacfToAR(rep(0.5,10))
p<-length(phi)
z<-SeriesA-mean(SeriesA)
n<-length(z)
L1<-LoglikelihoodAR(phi, z)
cd<-ChampernowneD(z,p,MeanZero=TRUE)
L2<-FastLoglikelihoodAR(phi,n,cd)
out<-c(L1,L2)
names(out)<-c("direct","fast")
out



