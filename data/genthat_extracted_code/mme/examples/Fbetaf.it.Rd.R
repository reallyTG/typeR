library(mme)


### Name: Fbetaf.it
### Title: The inverse of the Fisher information matrix of the fixed and
###   random effects for Model 2
### Aliases: Fbetaf.it
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=2  #Type of model
data(simdata2) #data
datar=data.mme(simdata2,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities)

##The inverse of the Fisher information matrix of the fixed effects
Fisher=Fbetaf.it(sigmap,datar$X,datar$Z,initial$phi1.0,initial$phi2.0,
       datar$y[,1:(k-1)],mean$mean,initial$u1.0,initial$u2.0)



