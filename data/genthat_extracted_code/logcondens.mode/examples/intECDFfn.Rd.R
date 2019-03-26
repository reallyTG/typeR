library(logcondens.mode)


### Name: intECDFfn
### Title: Gives the Integrated Empirical Distribution Function
### Aliases: intECDFfn
### Keywords: htest nonparametric

### ** Examples


set.seed(100)
xx <- runif(50) ## min .056, max .88

myIntECDF <- intECDFfn(xx);
evalpts <- c(.3, .5) ## lie within [ min(xx) , max(xx) ]
myIntECDF(evalpts)
## equal to
intECDF(evalpts, xx)




