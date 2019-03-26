library(mme)


### Name: modelfit3
### Title: Function used to fit Model 3
### Aliases: modelfit3
### Keywords: models

### ** Examples

## Not run: 
##D 
##D k=3 #number of categories of the response variable
##D pp=c(1,1) #vector with the number of auxiliary variables in each category
##D mod=3 #type of model
##D data(simdata3)   #data
##D datar=data.mme(simdata3,k,pp,mod)
##D 
##D ##Model fit
##D result=modelfit3(datar$d,datar$t,pp,datar$Xk,datar$X,datar$Z,datar$initial,datar$y[,1:(k-1)],
##D        datar$n,datar$N,0)
## End(Not run)



