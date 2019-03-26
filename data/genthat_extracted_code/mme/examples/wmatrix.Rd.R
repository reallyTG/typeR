library(mme)


### Name: wmatrix
### Title: Model variance-covariance matrix of the multinomial mixed models
### Aliases: wmatrix
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=2 #type of model
data(simdata2)
datar=data.mme(simdata2,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
##The model variance-covariance matrix
varcov=wmatrix(datar$n,mean$estimated.probabilities)



