library(bairt)


### Name: model.mcmc
### Title: MCMC object model
### Aliases: model.mcmc

### ** Examples

# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 100, burning = 0)
iter.mcmc(model2)
burning.mcmc(model2)
thin(model2)
parts.mcmc(model2)
model.mcmc(model2)
data.mcmc(model2)

## No test: 
# For all examinees of the data MathTest
# Three-Parameter Normal Ogive Model
model3 <- mcmc.3pnob(MathTest, iter = 3500, burning = 500)
iter.mcmc(model3)
burning.mcmc(model3)
thin(model3)
parts.mcmc(model3)
model.mcmc(model3)
data.mcmc(model3)
## End(No test)

## End(Not run)




