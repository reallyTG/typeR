library(FitARMA)


### Name: InformationMatrixARMA
### Title: Expected large-sample information matrix for ARMA
### Aliases: InformationMatrixARMA
### Keywords: ts

### ** Examples

#The covariance matrix estimates of the parameters phi and theta in an ARMA(1,1)
#with phi=0.9 and theta=0.5 and n=200 is
v<-solve(InformationMatrixARMA(0.9,0.5))/200
v
#and the standard errors are
sqrt(diag(v))
  


