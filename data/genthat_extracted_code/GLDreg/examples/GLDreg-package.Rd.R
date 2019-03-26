library(GLDreg)


### Name: GLDreg-package
### Title: This package fits standard and quantile regression models using
###   RS and FMKL/FKML generalised lambda distributions via maximum
###   likelihood estimation and L moment matching.
### Aliases: GLDreg-package GLDreg
### Keywords: model

### ** Examples


## Dummy example

## Create dataset

set.seed(10)

x<-rnorm(200,3,2)
y<-3*x+rnorm(200)

dat<-data.frame(y,x)

## Fit a FKML GLD regression

example<-GLD.lm(y~x,data=dat,fun=fun.RMFMKL.ml.m,param="fkml")

## Fit FKML GLD regression with 3 simulations

fit<-GLD.lm.full(y~x,data=dat,fun=fun.RMFMKL.ml.m,param="fkml",n.simu=3)

## Find median regression, use empirical method

med.fit<-GLD.quantreg(0.5,fit,slope="fixed",emp=TRUE)

## Not run: 
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
##D ## Plot coefficient summary
##D 
##D summaryGraphics.gld.lm(engel.fit.all)
##D 
##D ## Fit quantile regression from 0.1 to 0.9, with equal spacings between 
##D ## quantiles
##D 
##D result<-GLD.quantreg(seq(0.1,.9,length=9),engel.fit.all,intercept="fixed")
##D 
##D ## Plot quantile regression lines
##D 
##D fun.plot.q(x=engel$income,y=engel$foodexp,fit=engel.fit.all[[1]],result,
##D xlab="income",ylab="Food Expense")
##D 
##D ## Sometimes the maximum likelihood estimation may fail, for example when 
##D ## minimum/maximum support of GLD is exactly at the minimum/maximum value of the 
##D ## dataset, if this the case, try to use the L-moment matching method.
##D 
##D engel.fit.all<-GLD.lm.full(foodexp~income,data=engel,
##D param="fmkl",fun=fun.RMFMKL.lm)
##D 
## End(Not run)



