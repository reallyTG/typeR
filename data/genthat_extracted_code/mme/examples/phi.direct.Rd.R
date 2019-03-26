library(mme)


### Name: phi.direct
### Title: Variance components for Model 1
### Aliases: phi.direct
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)   #data
mod=1 #type of model
datar=data.mme(simdata,k,pp,mod)
initial=datar$initial
mean=prmu(datar$n,datar$Xk,initial$beta.0,initial$u.0)
#model variance-covariance matrix
sigmap=wmatrix(datar$n,mean$estimated.probabilities)

##Variance components
phi=phi.direct(sigmap,initial$phi.0,datar$X,initial$u.0)



