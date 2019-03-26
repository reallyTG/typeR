library(mme)


### Name: model
### Title: Choose between the three models
### Aliases: model
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)  #data
mod=1 #Model 1
datar=data.mme(simdata,k,pp,mod)
result=model(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
datar$n,datar$N, mod)



