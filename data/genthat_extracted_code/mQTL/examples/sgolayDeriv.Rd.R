library(mQTL)


### Name: sgolayDeriv
### Title: Calculate smoothed derivates
### Aliases: sgolayDeriv
### Keywords: function

### ** Examples


## Data

Sp=matrix(rnorm(10*13454,mean=0,sd=1), nrow=10,ncol=13454)

## Peak picking
Spectrum<-Sp[10,]
iOrder <- 3
iFrameLen<- 11
j<-2

SpDerivs=sgolayDeriv(Spectrum,iOrder,iFrameLen,j)




