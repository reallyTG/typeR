library(mme)


### Name: simdata2
### Title: Dataset for Model 2
### Aliases: simdata2
### Keywords: datasets

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
data(simdata2)
mod=2 #type of model
datar=data.mme(simdata2,k,pp,mod)

##Model fit
result=model(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N,mod)

##Analytic MSE
msef=msef.it(pp,datar$X,result,datar$n,datar$N)

B=1    #Bootstrap iterations
ss=12345 #SEED
set.seed(ss)

##Bootstrap parametric BIAS and MSE
mse.pboot=mseb(pp,datar$Xk,datar$X,datar$Z,datar$n,datar$N,result,B,mod)



