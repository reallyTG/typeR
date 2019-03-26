library(simFrame)


### Name: contaminate
### Title: Contaminate data
### Aliases: contaminate contaminate-methods
###   contaminate,data.frame,character-method
###   contaminate,data.frame,ContControl-method
###   contaminate,data.frame,missing-method
### Keywords: manip methods

### ** Examples

## distributed completely at random
data(eusilcP)
sam <- draw(eusilcP[, c("id", "eqIncome")], size = 20)

# using a control object
dcarc <- ContControl(target = "eqIncome", epsilon = 0.05, 
    dots = list(mean = 5e+05, sd = 10000), type = "DCAR")
contaminate(sam, dcarc)

# supply slots of control object as arguments
contaminate(sam, target = "eqIncome", epsilon = 0.05, 
    dots = list(mean = 5e+05, sd = 10000))


## distributed at random
require(mvtnorm)
mean <- rep(0, 2)
sigma <- matrix(c(1, 0.5, 0.5, 1), 2, 2)
foo <- generate(size = 10, distribution = rmvnorm, 
    dots = list(mean = mean, sigma = sigma))

# using a control object
darc <- DARContControl(target = "V2", 
    epsilon = 0.2, fun = function(x) x * 100)
contaminate(foo, darc)

# supply slots of control object as arguments
contaminate(foo, "DARContControl", target = "V2",
    epsilon = 0.2, fun = function(x) x * 100)



