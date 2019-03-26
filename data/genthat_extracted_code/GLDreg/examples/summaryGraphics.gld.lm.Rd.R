library(GLDreg)


### Name: summaryGraphics.gld.lm
### Title: Graphical display of output from 'GLD.lm.full'
### Aliases: summaryGraphics.gld.lm
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

## Note this is for illustration only, need to set number
## of simulations around 1000 usually for the graphics below 
## to be meaningful

summaryGraphics.gld.lm(fit,ColourVersion=FALSE,diagnostic=FALSE)

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
##D ## Plot coefficient summary
##D 
##D summaryGraphics.gld.lm(engel.fit.full,ColourVersion=FALSE,diagnostic=FALSE)
##D 
##D summaryGraphics.gld.lm(engel.fit.full)
##D 
##D ## Extract the mammals dataset 
##D library(MASS)
##D 
##D ## Fit a full GLD regression
##D 
##D mammals.fit.full<-GLD.lm.full(log(brain)~log(body),data=mammals,param="fmkl",
##D fun=fun.RMFMKL.ml.m)
##D 
##D ## Plot coefficient summary
##D 
##D summaryGraphics.gld.lm(mammals.fit.full,label=c("intercept","log of body weight"))
##D 
## End(Not run)



