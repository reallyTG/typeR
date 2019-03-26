library(cosso)


### Name: tune.cosso
### Title: Tuning procedure for cosso
### Aliases: tune.cosso

### ** Examples
 
## Binomial
set.seed(20130310)
x=cbind(rbinom(150,1,.7),matrix(runif(150*5,0,1),nc=5))
trueProb=1/(1+exp(-x[,1]-sin(2*pi*x[,2])-5*(x[,4]-0.4)^2))
y=rbinom(150,1,trueProb)

B.Obj=cosso(x,y,family="Bin",nbasis=30) 
tune.cosso(B.Obj,4,TRUE)



