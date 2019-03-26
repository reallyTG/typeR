library(mme)


### Name: simdata
### Title: Dataset for Model 1
### Aliases: simdata
### Keywords: datasets

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata)  #data
mod=1 # type of model
datar=data.mme(simdata,k,pp,mod)
# Model fit
result=model(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N,mod)

#Analytic MSE
mse=msef(pp,datar$X,datar$Z,result,datar$N,datar$n)

B=1    #Bootstrap iterations
ss=12345 #SEED
set.seed(ss)

##Bootstrap parametric BIAS and MSE
mse.pboot=mseb(pp,datar$Xk,datar$X,datar$Z,datar$n,datar$N,result,B,mod)



