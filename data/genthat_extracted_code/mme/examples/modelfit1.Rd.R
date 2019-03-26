library(mme)


### Name: modelfit1
### Title: Function used to fit Model 1
### Aliases: modelfit1
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)  #data
mod=1 #type of model
datar=data.mme(simdata,k,pp,mod)

#Model fit
result=modelfit1(pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
      datar$n,datar$N)



