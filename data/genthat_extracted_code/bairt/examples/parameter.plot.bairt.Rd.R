library(bairt)


### Name: parameter.plot.bairt
### Title: Graph of marginal posterior densities
### Aliases: parameter.plot.bairt

### ** Examples

# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 400, burning = 100)
parameter.plot(model2)
parameter.plot(model2, items = c(2, 10:15))
parameter.plot(model2, items = 1:100, parameter = "theta" )

## No test: 
# For all examinees of the data MathTest
# Three-Parameter Normal Ogive Model
model3 <- mcmc.3pnob(MathTest, iter = 3500, burning = 500)
parameter.plot(model3)
parameter.plot(model3, items = c(2, 10:15))
parameter.plot(model3, items = 1:100, parameter = c("c", "theta"))
## End(No test)

## End(Not run)




