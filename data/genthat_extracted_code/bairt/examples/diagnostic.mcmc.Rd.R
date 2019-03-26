library(bairt)


### Name: diagnostic.mcmc
### Title: Diagnostic of _mcmc.2pnob_ or _mcmc.3pnob_ object
### Aliases: diagnostic.mcmc

### ** Examples

# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 100, burning = 0)
diagnostic.mcmc(model2)

## No test: 
# For all examinees of the data MathTest
# Three-Parameter Normal Ogive Model
model3 <- mcmc.3pnob(MathTest, iter = 3500, burning = 500)
diagnostic.mcmc(model3)
## End(No test)

## End(Not run)





