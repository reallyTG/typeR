library(GLDreg)


### Name: GLD.quantreg
### Title: Fit a GLD quantile regression parametrically or non
###   parametrically
### Aliases: GLD.quantreg
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
##D ## Fit parametric GLD quantile regression from 0.1 to 0.9, with equal spacings 
##D ## between quantiles
##D 
##D result<-GLD.quantreg(seq(0.1,.9,length=9),engel.fit.all,intercept="fixed")
##D 
##D ## Non parametric quantile regression
##D 
##D GLD.quantreg(seq(0.1,.9,length=9),engel.fit.all,intercept="fixed",emp=T)
##D 
## End(Not run)



