library(mQTL)


### Name: normalise
### Title: Normalisation of metabolomic data
### Aliases: normalise
### Keywords: methods

### ** Examples


## Data
Sp=matrix(rnorm(10*13454,mean=0,sd=1), nrow=10,ncol=13454)

## Quotient probabilistic normalisation
NormDat<-normalise(abs(Sp),'prob')




