library(mme)


### Name: msef.it
### Title: Analytic MSE for Model 2
### Aliases: msef.it
### Keywords: models

### ** Examples

k=3 #number of categories of the response variable
pp=c(1,1) #vector with the number of auxiliary variables in each category
mod=2 #type of model
data(simdata2)
datar=data.mme(simdata2,k,pp,mod)
##Model fit
result=modelfit2(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
       datar$n,datar$N)

##Analytic MSE
msef=msef.it(pp,datar$X,result,datar$n,datar$N)



