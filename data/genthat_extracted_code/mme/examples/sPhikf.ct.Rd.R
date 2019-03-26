library(mme)


### Name: sPhikf.ct
### Title: Fisher information matrix and score vectors of the variance
###   components for Model 3
### Aliases: sPhikf.ct
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=3 #type of model
data(simdata3) #data
datar=data.mme(simdata3,k,pp, mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities)

## Fisher information matrix and the score vectors
Fisher.phi.ct=sPhikf.ct(datar$d,datar$t,pp,sigmap,datar$X,mean$eta,initial$phi1.0,
           initial$phi2.0,initial$rho.0,mean$estimated.probabilities,datar$n)



