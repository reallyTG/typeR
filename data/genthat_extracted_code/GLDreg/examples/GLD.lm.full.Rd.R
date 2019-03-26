library(GLDreg)


### Name: GLD.lm.full
### Title: This function fits a GLD regression linear model and conducts
###   simulations to display the statistical properties of estimated
###   coefficients
### Aliases: GLD.lm.full
### Keywords: model

### ** Examples


## Dummy example

## Create dataset

set.seed(10)

x<-rnorm(200,3,2)
y<-3*x+rnorm(200)

dat<-data.frame(y,x)

## Fit FKML GLD regression with 3 simulations

fit<-GLD.lm.full(y~x,data=dat,fun=fun.RMFMKL.ml.m,param="fkml",n.simu=3)

## Not run: 
##D ## Extract the Engel dataset 
##D 
##D library(quantreg)
##D data(engel)
##D 
##D ## Fit a full GLD regression
##D 
##D engel.fit.full<-GLD.lm.full(foodexp~income,data=engel,param="fmkl",
##D fun=fun.RMFMKL.ml.m)
##D 
##D ## Extract the mammals dataset 
##D library(MASS)
##D 
##D ## Fit a full GLD regression
##D 
##D mammals.fit.full<-GLD.lm.full(log(brain)~log(body),data=mammals,param="fmkl",
##D fun=fun.RMFMKL.ml.m)
##D 
##D ## Using quantile regression coefficients as starting values
##D library(quantreg)
##D 
##D mammals.fit1.full<-GLD.lm.full(log(brain)~log(body),data=mammals,param="fmkl",
##D fun=fun.RMFMKL.ml.m, init=rq(log(brain)~log(body),data=mammals)$coeff)
##D 
##D ## Using the result of mammals.fit.full as initial values
##D 
##D mammals.fit2.full<-GLD.lm.full(log(brain)~log(body),data=mammals,param="fmkl",
##D fun=fun.RMFMKL.ml.m, init=mammals.fit1.full[[1]][[3]])
## End(Not run)



