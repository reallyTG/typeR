library(mme)


### Name: sPhikf
### Title: Fisher information matrix and score vectors of the variance
###   components for Model 1
### Aliases: sPhikf
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata) #data
mod=1 #type of model
datar=data.mme(simdata,k,pp, mod)
initial=datar$initial
mean=prmu(datar$n,datar$Xk,initial$beta.0,initial$u.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities)

##Fisher information matrix and score vectors
Fisher.phi=sPhikf(pp,sigmap,datar$X,mean$eta,initial$phi.0)



