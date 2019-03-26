library(tatest)


### Name: momega
### Title: Null rho for testing multiple null hypotheses
### Aliases: momega
### Keywords: null rho multiple tests

### ** Examples

data(Ecadherin)
Ecad<-as.data.frame(Ecadherin)
Ecad1<-Ecad[,-1]
w<-momega(dat=Ecad1[1:2000,], na=3, nb=3, distr = "norm")



