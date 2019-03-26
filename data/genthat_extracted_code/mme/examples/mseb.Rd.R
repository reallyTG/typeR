library(mme)


### Name: mseb
### Title: Bias and MSE using parametric bootstrap
### Aliases: mseb
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)
mod=1  # Type of model
datar=data.mme(simdata,k,pp,mod)
##Model fit
result=modelfit1(pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],datar$n,datar$N)

B=1    #Bootstrap iterations
ss=12345 #SEED
set.seed(ss)

##Bootstrap parametric BIAS and MSE
mse.pboot=mseb(pp,datar$Xk,datar$X,datar$Z,datar$n,datar$N,result,B,mod)



