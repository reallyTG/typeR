library(simFrame)


### Name: DataControl-class
### Title: Class "DataControl"
### Aliases: DataControl-class DataControl getSize,DataControl-method
###   setSize,DataControl-method getDistribution,DataControl-method
###   setDistribution,DataControl-method getDots,DataControl-method
###   setDots,DataControl-method getColnames,DataControl-method
###   setColnames,DataControl-method show,DataControl-method
###   dataControl-class datacontrol-class Datacontrol-class dataControl
###   datacontrol Datacontrol
### Keywords: classes

### ** Examples

require(mvtnorm)
mean <- rep(0, 2)
sigma <- matrix(c(1, 0.5, 0.5, 1), 2, 2)
dc <- DataControl(size = 10, distribution = rmvnorm, 
    dots = list(mean = mean, sigma = sigma))
generate(dc)



