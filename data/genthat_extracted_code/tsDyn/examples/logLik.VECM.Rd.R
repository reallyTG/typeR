library(tsDyn)


### Name: logLik.VECM
### Title: Extract Log-Likelihood
### Aliases: logLik.VECM
### Keywords: ts

### ** Examples


data(zeroyld)
data<-zeroyld

#Fit a VAR
vecm<-VECM(data, lag=1,r=1, estim="ML")
logLik(vecm)




