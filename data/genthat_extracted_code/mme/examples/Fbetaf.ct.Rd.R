library(mme)


### Name: Fbetaf.ct
### Title: Inverse of the Fisher information matrix of fixed and random
###   effects in Model 3
### Aliases: Fbetaf.ct
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=3 #type of model
data(simdata3)
datar=data.mme(simdata3,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)
sigmap=wmatrix(datar$n,mean$estimated.probabilities) #variance-covariance

##The inverse of the Fisher information matrix and the score matrix
Fisher.beta=Fbetaf.ct(sigmap,datar$X,datar$Z,initial$phi1.0,initial$phi2.0,
         datar$y[,1:(k-1)],mean$mean,initial$u1.0,initial$u2.0,initial$rho.0)



