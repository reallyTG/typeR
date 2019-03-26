library(mme)


### Name: ci
### Title: Standard deviation and p-values of the estimated model
###   parameters
### Aliases: ci
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata) #data
mod=1  #Type of model
datar=data.mme(simdata,k,pp,mod)

#Model fit
result=modelfit1(pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N)
beta=result[[8]][,1] #fixed effects
Fisher=result[[3]] #Fisher information matrix

##Standard deviation and p-values
res=ci(beta,Fisher)



