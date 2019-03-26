library(acopula)


### Name: nderive
### Title: Numerical derivative
### Aliases: nderive
### Keywords: derivative linear approximation

### ** Examples

##density of a bivariate Gumbel copula evaluated in point c(0.5,0.6)
nderive(fun = function(x) pCopula(x,genGumbel(),gpar=3.5), point = c(0.5,0.6),
        order = c(1,1))



