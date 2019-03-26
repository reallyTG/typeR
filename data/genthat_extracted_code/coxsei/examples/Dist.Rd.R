library(coxsei)


### Name: Dist
### Title: Distribution function
### Aliases: Dist
### Keywords: ~distribution ~survival

### ** Examples

curve(Dist(x,int=function(x)3*x^2),0,5)
curve(pweibull(x,shape=3),0,5,add=TRUE,col=3,lty=3)



