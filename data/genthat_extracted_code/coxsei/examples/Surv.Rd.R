library(coxsei)


### Name: Surv
### Title: Survival function
### Aliases: Surv
### Keywords: ~distribution ~survival

### ** Examples

curve(Surv(x, int=function(x)3*x^2), from=0, to=5)
curve(pweibull(x,shape=3,lower=FALSE), add=TRUE, col=2, lty=3)



