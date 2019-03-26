library(cosso)


### Name: cosso
### Title: Fit a generalized nonparametric model with cosso penalty
### Aliases: cosso

### ** Examples

## Gaussian
set.seed(20130310)
x=cbind(rbinom(200,1,.7),matrix(runif(200*9,0,1),nc=9))
y=x[,1]+sin(2*pi*x[,2])+5*(x[,4]-0.4)^2+rnorm(200,0,1)
G.Obj=cosso(x,y,family="Gaussian")
plot.cosso(G.Obj,plottype="Path")

## Not run: 
##D ## Use all observations as knots
##D set.seed(20130310)
##D x=cbind(rbinom(200,1,.7),matrix(runif(200*9,0,1),nc=9))
##D y=x[,1]+sin(2*pi*x[,2])+5*(x[,4]-0.4)^2+rnorm(200,0,1)
##D G.Obj=cosso(x,y,family="Gaussian",nbasis=200)
##D ## Clean up
##D rm(list=ls())
##D 
##D ## Binomial
##D set.seed(20130310)
##D x=cbind(rbinom(200,1,.7),matrix(runif(200*9,0,1),nc=9))
##D trueProb=1/(1+exp(-x[,1]-sin(2*pi*x[,2])-5*(x[,4]-0.4)^2))
##D y=rbinom(200,1,trueProb)
##D 
##D B.Obj=cosso(x,y,family="Bin") 
##D ## Clean up
##D rm(list=ls())
##D 
##D ## Cox
##D set.seed(20130310)
##D x=cbind(rbinom(200,1,.7),matrix(runif(200*9,0,1),nc=9))
##D hazard=x[,1]+sin(2*pi*x[,2])+5*(x[,4]-0.4)^2
##D surTime=rexp(200,exp(hazard))
##D cenTime=rexp(200,exp(-hazard)*runif(1,4,6))
##D y=cbind(time=apply(cbind(surTime,cenTime),1,min),status=1*(surTime<cenTime))
##D C.obj=cosso(x,y,family="Cox",cpus=1)
##D 
##D ## Try parallel computing
##D C.obj=cosso(x,y,family="Cox",cpus=4)
##D 
##D ## Clean up
##D rm(list=ls())
##D 
##D ## Quantile
##D set.seed(20130310)
##D x=cbind(rbinom(200,1,.7),matrix(runif(200*7,0,1),nc=7))
##D y=x[,1]+sin(2*pi*x[,2])+5*(x[,4]-0.4)^2+rt(200,3)
##D Q.obj=cosso(x,y,0.3,family="Quan",cpus=1)
##D 
##D ## Try parallel computing
##D Q.obj=cosso(x,y,0.3,family="Quan",cpus=4)
## End(Not run)




