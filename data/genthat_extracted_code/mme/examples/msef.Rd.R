library(mme)


### Name: msef
### Title: Analytic MSE for Model 1
### Aliases: msef
### Keywords: models

### ** Examples

require(Matrix)

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)  #data
mod=1 # type of model
datar=data.mme(simdata,k,pp,mod)
# Model fit
result=modelfit1(pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N)

#Analytic MSE
mse=msef(pp,datar$X,datar$Z,result,datar$N,datar$n)



