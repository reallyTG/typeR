library(simFrame)


### Name: DARContControl-class
### Title: Class "DARContControl"
### Aliases: DARContControl-class DARContControl
###   getFun,DARContControl-method setFun,DARContControl-method
###   getDots,DARContControl-method setDots,DARContControl-method
###   DARcontControl DARcontcontrol DARContcontrol DARcontControl-class
###   DARcontcontrol-class DARContcontrol-class darcontControl
###   darcontcontrol darContcontrol darcontControl-class
###   darcontcontrol-class darContcontrol-class
### Keywords: classes

### ** Examples

require(mvtnorm)
mean <- rep(0, 2)
sigma <- matrix(c(1, 0.5, 0.5, 1), 2, 2)
foo <- generate(size = 10, distribution = rmvnorm, 
    dots = list(mean = mean, sigma = sigma))
cc <- DARContControl(target = "V2",
    epsilon = 0.2, fun = function(x) x * 100)
contaminate(foo, cc)



