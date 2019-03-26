library(cosso)


### Name: plot.cosso
### Title: Plot method for COSSO object
### Aliases: plot.cosso

### ** Examples
 
set.seed(20130310)
x=cbind(rbinom(200,1,.7),matrix(runif(200*7,0,1),nc=7))
trueProb=1/(1+exp(-x[,1]-sin(2*pi*x[,2])-5*(x[,4]-0.4)^2))
y=rbinom(200,1,trueProb)

B.Obj=cosso(x,y,family="Bin") 
plot.cosso(B.Obj,plottype="Path")
plot.cosso(B.Obj,M=2,plottype="Func")



