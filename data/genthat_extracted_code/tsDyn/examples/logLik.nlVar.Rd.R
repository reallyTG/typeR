library(tsDyn)


### Name: logLik.nlVar
### Title: Extract Log-Likelihood
### Aliases: logLik.nlVar
### Keywords: ts

### ** Examples


data(zeroyld)
data<-zeroyld

#Fit a VAR
VAR<-lineVar(data, lag=1)
logLik(VAR)




