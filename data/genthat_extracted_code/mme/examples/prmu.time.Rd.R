library(mme)


### Name: prmu.time
### Title: Estimated mean and probabilities for Model 2 and 3
### Aliases: prmu.time
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=2 #Type of model
data(simdata2) # data
datar=data.mme(simdata2,k,pp,mod)
initial=datar$initial

## Estimated mean and estimated probabilities
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)



