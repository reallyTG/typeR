library(mme)


### Name: omega
### Title: Model correlation matrix for Model 3
### Aliases: omega
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=3 #type of model
data(simdata3)   #data
datar=data.mme(simdata3,k,pp,mod)
initial=datar$initial
mean=prmu.time(datar$n,datar$Xk,initial$beta.0,initial$u1.0,initial$u2.0)

##The model correlation matrix
matrix.corr=omega(datar$t,k,initial$rho.0,initial$phi2.0)



