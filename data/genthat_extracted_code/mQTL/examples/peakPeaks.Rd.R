library(mQTL)


### Name: peakPeaks
### Title: Peak picking algorithm
### Aliases: peakPeaks
### Keywords: methods

### ** Examples


## Data
Sp=matrix(rnorm(10*13454,mean=0,sd=1), nrow=10,ncol=13454)

## Peak picking
Spectrum<-Sp[1,]
iOrder <- 3
iFrameLen<- 11

SpDerivs=sgolayDeriv(Spectrum,iOrder,iFrameLen,2)
SpSmooth = sgolayDeriv(Spectrum,iOrder,iFrameLen,1)
peaks=peakPeaks(SpSmooth,SpDerivs,Spectrum)



