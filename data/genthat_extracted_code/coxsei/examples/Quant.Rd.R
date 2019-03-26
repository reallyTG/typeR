library(coxsei)


### Name: Quant
### Title: Quantile function
### Aliases: Quant
### Keywords: ~distribution ~survival

### ** Examples

curve(Quant(x,int=function(x)3*x^2),from=1e-3,to=1 - 1e-3)
curve(qweibull(x,shape=3),col=3,lty=3,add=TRUE)



