library(mme)


### Name: prmu
### Title: Estimated mean and probabilities for Model 1
### Aliases: prmu
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata) #data
mod=1 #type of model
D=nrow(simdata)
datar=data.mme(simdata,k,pp,mod)
initial=datar$initial

##Estimated mean and probabilities
mean=prmu(datar$n,datar$Xk,initial$beta.0,initial$u.0)



