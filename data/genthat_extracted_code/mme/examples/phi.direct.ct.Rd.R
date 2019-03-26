library(mme)


### Name: phi.direct.ct
### Title: Variance components for Model 3
### Aliases: phi.direct.ct
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=3 #type of model
data(simdata3) #data
datar=data.mme(simdata3,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities)

##The variance components
phi.ct=phi.direct.ct(pp,sigmap,datar$X,mean$eta,initial$phi1.0,
       initial$phi2.0,initial$u1.0,initial$u2.0,initial$rho.0)



