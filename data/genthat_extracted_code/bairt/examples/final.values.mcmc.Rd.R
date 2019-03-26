library(bairt)


### Name: final.values.mcmc
### Title: Values of the last iteration for each chain
### Aliases: final.values.mcmc

### ** Examples

# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 100, burning = 0)

# continue the  MCMC for the Two-Parameter Normal Ogive Model
initialValues2 <- final.values.mcmc(model2)
model121 <- mcmc.2pnob(MathTest[1:500,], initial.value = initialValues2,
iter = 100, burning = 0)

## No test: 
# For all examinees of the data MathTest
# Three-Parameter Normal Ogive Model
model3 <- mcmc.3pnob(MathTest, iter = 3500, burning = 500)

# continue the  MCMC for the Three-Parameter Normal Ogive Model
initialValues3 <- final.values.mcmc(model3)
model131 <- mcmc.3pnob(MathTest, initial.value = initialValues3,
iter = 3000, burning = 0)
## End(No test)

## End(Not run)




