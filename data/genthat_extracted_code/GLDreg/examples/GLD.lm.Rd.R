library(GLDreg)


### Name: GLD.lm
### Title: This function fits a GLD regression linear model
### Aliases: GLD.lm
### Keywords: model

### ** Examples


## Dummy example

library(GLDEX)

## Create dataset

set.seed(10)

x<-rnorm(200,3,2)
y<-3*x+rnorm(200)

dat<-data.frame(y,x)

## Fit a FKML GLD regression

example<-GLD.lm(y~x,data=dat,fun=fun.RMFMKL.ml.m,param="fkml")

## Not run: 
##D 
##D ## Extract the Engel dataset 
##D library(quantreg)
##D data(engel)
##D 
##D ## Fit GLD Regression
##D engel.fit<-GLD.lm(foodexp~income,data=engel,param="fmkl",fun=fun.RMFMKL.ml.m)
##D 
##D ## Extract the mammals dataset 
##D library(MASS)
##D 
##D mammals.fit<-GLD.lm(log(brain)~log(body),data=mammals,param="rs",
##D fun=fun.RPRS.lm)
##D 
##D ## Using quantile regression coefficients as starting values
##D library(quantreg)
##D 
##D mammals.fit1<-GLD.lm(log(brain)~log(body),data=mammals,param="rs",
##D fun=fun.RPRS.lm,init=rq(log(brain)~log(body),data=mammals)$coeff)
##D 
##D # As an exercise, use the result from mammals.fit1 as initial values
##D 
##D GLD.lm(log(brain)~log(body),data=mammals,param="rs",
##D fun=fun.RPRS.lm,init=mammals.fit1[[3]])
## End(Not run)



