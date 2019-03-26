library(mme)


### Name: sPhikf.it
### Title: Fisher information matrix and score vectors of the variance
###   components for Model 2
### Aliases: sPhikf.it
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=2 #Type of model
data(simdata2) #data
datar=data.mme(simdata2,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities)

##Fisher information matrix and score vectors
Fisher.phi=sPhikf.it(datar$d,datar$t,pp,sigmap,datar$X,mean$eta,initial$phi1.0,
           initial$phi2.0)



