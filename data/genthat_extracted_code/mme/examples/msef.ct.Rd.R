library(mme)


### Name: msef.ct
### Title: Analytic MSE for Model 3
### Aliases: msef.ct
### Keywords: models

### ** Examples

## Not run: 
##D 
##D k=3 #number of categories of the response variable
##D pp=c(1,1) #vector with the number of auxiliary variables in each category
##D mod=3 #type of model
##D data(simdata3) #data
##D datar=data.mme(simdata3,k,pp,mod)
##D ##Model fit
##D result=modelfit3(d,t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
##D        datar$n,datar$N,0)
##D 
##D ##Analytic MSE
##D msef=msef.ct(pp,datar$X,result,datar$n,datar$N)
## End(Not run)



