library(mme)


### Name: simdata3
### Title: Dataset for Model 3
### Aliases: simdata3
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D k=3 #number of categories of the response variable
##D pp=c(1,1) #vector with the number of auxiliary variables in each category
##D mod=3 #type of model
##D data(simdata3) #data
##D datar=data.mme(simdata3,k,pp,mod)
##D ##Model fit
##D result=model(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
##D        datar$n,datar$N,mod)
##D 
##D ##Analytic MSE
##D msef=msef.ct(pp,datar$X,result,datar$n,datar$N)
##D 
##D B=1    #Bootstrap iterations
##D ss=12345 #SEED
##D set.seed(ss)
##D 
##D ##Bootstrap parametric BIAS and MSE
##D mse.pboot=mseb(pp,datar$Xk,datar$X,datar$Z,datar$n,datar$N,result,B,mod)
## End(Not run)



