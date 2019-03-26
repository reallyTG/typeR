library(cosso)


### Name: SSANOVAwt
### Title: Compute adaptive weights by fitting a SS-ANOVA model
### Aliases: SSANOVAwt

### ** Examples

## Adaptive COSSO Model
## Binomial
set.seed(20130310)
x=cbind(rbinom(200,1,.7),matrix(runif(200*7,0,1),nc=7))
trueProb=1/(1+exp(-x[,1]-sin(2*pi*x[,2])-5*(x[,4]-0.4)^2))
y=rbinom(200,1,trueProb)

Binomial.wt=SSANOVAwt(x,y,family="Bin")
ada.B.Obj=cosso(x,y,wt=Binomial.wt,family="Bin") 

## Not run: 
##D ## Gaussian
##D set.seed(20130310)
##D x=cbind(rbinom(200,1,.7),matrix(runif(200*7,0,1),nc=7))
##D y=x[,1]+sin(2*pi*x[,2])+5*(x[,4]-0.4)^2+rnorm(200,0,1)
##D Gaussian.wt=SSANOVAwt(designx,response,family="Gau")
##D ada.G.Obj=cosso(x,y,wt=Gaussian.wt,family="Gaussian")
## End(Not run)




