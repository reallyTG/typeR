library(cosso)


### Name: predict.cosso
### Title: Make predictions or extract coefficients from a cosso model
### Aliases: predict.cosso

### ** Examples
 
## Gaussian
set.seed(20130310)
x=cbind(rbinom(200,1,.7),matrix(runif(200*7,0,1),nc=7))
y=x[,1]+sin(2*pi*x[,2])+5*(x[,4]-0.4)^2+rnorm(200,0,1)
G.Obj=cosso(x,y,family="Gaussian")
predict.cosso(G.Obj,M=2,type="nonzero")
predict.cosso(G.Obj,xnew=x[1:3,],M=2,type="fit")
## Clean up
rm(list=ls())

## Not run: 
##D ## Binomial
##D set.seed(20130310)
##D x=cbind(rbinom(200,1,.7),matrix(runif(200*9,0,1),nc=9))
##D trueProb=1/(1+exp(-x[,1]-sin(2*pi*x[,2])-5*(x[,4]-0.4)^2))
##D y=rbinom(200,1,trueProb)
##D 
##D B.Obj=cosso(x,y,family="Bin") 
##D f.hat=predict.cosso(B.Obj,xnew=x,M=2,type="fit")
##D prob.hat=1/(1+exp(-f.hat))
##D ## Clean up
##D rm(list=ls())
## End(Not run)



