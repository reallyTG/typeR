library(mme)


### Name: modelfit2
### Title: Function to fit Model 2
### Aliases: modelfit2
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=2 #type of model
data(simdata2)  #data
datar=data.mme(simdata2,k,pp,mod)

##Model fit
result=modelfit2(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N)



