library(FAdist)


### Name: WEIBULL3
### Title: Three-Parameter Weibull Distribution
### Aliases: dweibull3 pweibull3 qweibull3 rweibull3
### Keywords: distribution

### ** Examples

m <- 100
x <- rweibull3(10,3,1,m)
dweibull3(x,3,1,m)
dweibull(x-m,3,1)



