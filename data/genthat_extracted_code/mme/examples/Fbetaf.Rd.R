library(mme)


### Name: Fbetaf
### Title: Inverse of the Fisher information matrix of the fixed and random
###   effects in Model 1
### Aliases: Fbetaf
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata) #data
mod=1 #type of model
datar=data.mme(simdata,k,pp,mod)
initial=datar$initial
mean=prmu(datar$n,datar$Xk,initial$beta.0,initial$u.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities)

#Inverse of the Fisher information matrix
Fisher=Fbetaf(sigmap,datar$X,datar$Z,initial$phi.0,datar$y[,1:(k-1)],
       mean$mean,initial$u.0)



