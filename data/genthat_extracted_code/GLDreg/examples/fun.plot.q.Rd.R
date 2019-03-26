library(GLDreg)


### Name: fun.plot.q
### Title: 2-D Plot for Quantile Regression lines
### Aliases: fun.plot.q
### Keywords: hplot

### ** Examples


## Dummy example

## Create dataset

set.seed(10)

x<-rnorm(200,3,2)
y<-3*x+rnorm(200)

dat<-data.frame(y,x)

## Fit FKML GLD regression with 3 simulations

fit<-GLD.lm.full(y~x,data=dat,fun=fun.RMFMKL.ml.m,param="fkml",n.simu=3)

## Find median regression, use empirical method

med.fit<-GLD.quantreg(0.5,fit,slope="fixed",emp=TRUE)

fun.plot.q(x=x,y=y,fit=fit[[1]],med.fit, xlab="x",ylab="y")

## Not run: 
##D 
##D ## Plot result of quantile regression
##D 
##D ## Extract the Engel dataset 
##D 
##D library(quantreg)
##D data(engel)
##D 
##D ## Fit GLD Regression along with simulations
##D 
##D engel.fit.all<-GLD.lm.full(foodexp~income,data=engel,
##D param="fmkl",fun=fun.RMFMKL.ml.m)
##D 
##D ## Fit quantile regression from 0.1 to 0.9, with equal spacings between 
##D ## quantiles
##D 
##D result<-GLD.quantreg(seq(0.1,.9,length=9),engel.fit.all,intercept="fixed")
##D 
##D ## Plot the quantile regression lines
##D 
##D fun.plot.q(x=engel$income,y=engel$foodexp,fit=engel.fit.all[[1]],result,
##D xlab="income",ylab="Food Expense")
## End(Not run)



