library(mme)


### Name: print.mme
### Title: Print objects of class mme
### Aliases: print.mme
### Keywords: class

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=1  # Type of model
data(simdata)
datar=data.mme(simdata,k,pp,mod)
##Model fit
result=modelfit1(pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],datar$n,datar$N)
result



