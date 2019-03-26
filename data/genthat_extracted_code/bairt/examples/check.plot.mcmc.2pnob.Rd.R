library(bairt)


### Name: check.plot.mcmc.2pnob
### Title: Plot of the discrimination marginal posterior means against
###   difficulty marginal posterior means
### Aliases: check.plot.mcmc.2pnob

### ** Examples

# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 400, burning = 100)
check.plot(model2)
chain.study(model2, parameter = "b", chain = 12)
chain.study(model2, parameter = "theta", chain = 10)

## No test: 
# For all examinees of the data MathTest
# Two-Parameter Normal Ogive Model
modelAll2 <- mcmc.2pnob(MathTest, iter = 3500, burning = 500, thin = 10)
check.plot(modelAll2)
chain.study(modelAll2, parameter = "b", chain = 14)
chain.study(modelAll2, parameter = "theta", chain = 10)

# Three-Parameter Normal Ogive Model
modelAll3 <- mcmc.3pnob(MathTest, iter = 3500, burning = 500, thin = 10)
check.plot(modelAll3)
chain.study(modelAll3, parameter = "b", chain = 12)
chain.study(modelAll3, parameter = "c", chain = 10)
## End(No test)

## End(Not run)




