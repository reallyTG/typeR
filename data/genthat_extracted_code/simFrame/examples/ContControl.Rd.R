library(simFrame)


### Name: ContControl
### Title: Create contamination control objects
### Aliases: ContControl contControl contcontrol Contcontrol
### Keywords: classes

### ** Examples

## distributed completely at random
data(eusilcP)
sam <- draw(eusilcP[, c("id", "eqIncome")], size = 20)
dcarc <- ContControl(target = "eqIncome", epsilon = 0.05, 
    dots = list(mean = 5e+05, sd = 10000), type = "DCAR")
contaminate(sam, dcarc)

## distributed at random
require(mvtnorm)
mean <- rep(0, 2)
sigma <- matrix(c(1, 0.5, 0.5, 1), 2, 2)
foo <- generate(size = 10, distribution = rmvnorm, 
    dots = list(mean = mean, sigma = sigma))
darc <- ContControl(target = "V2", epsilon = 0.2, 
    fun = function(x) x * 100, type = "DAR")
contaminate(foo, darc)



