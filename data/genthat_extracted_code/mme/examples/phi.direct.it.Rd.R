library(mme)


### Name: phi.direct.it
### Title: Variance components for Model 2
### Aliases: phi.direct.it
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
d=10 #number of areas
mod=2  #Type of model
data(simdata2)   #data
datar=data.mme(simdata2,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities) #variance-covariance

## The variance components
phi.it=phi.direct.it(pp,sigmap,datar$X,initial$phi1.0,initial$phi2.0,
       initial$u1.0,initial$u2.0)



