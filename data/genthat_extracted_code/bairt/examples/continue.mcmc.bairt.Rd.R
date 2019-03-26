library(bairt)


### Name: continue.mcmc.bairt
### Title: Continue MCMC for the Estimation of the Two-Parameter or
###   Three-Parameter Normal Ogive Model
### Aliases: continue.mcmc.bairt

### ** Examples

# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 100, burning = 0)

# continue the  MCMC for the Two-Parameter Normal Ogive Model
model21 <- continue.mcmc(model2, iter = 100, burning = 0)

## No test: 
# For all examinees of the data MathTest
# Three-Parameter Normal Ogive Model
# selection of the prior for 5 response options
cprior <- select.c.prior(5)
modelAll3 <- mcmc.3pnob(MathTest, iter = 1000, burning = 0,
                    c.prior = cprior)

#continue the  MCMC for the Three-Parameter Normal Ogive Model
# form 1
initialValues2 <- final.values.mcmc(modelAll3)
modelAll31 <- mcmc.3pnob(MathTest, initial.value = initialValues2,
                     iter = 2000, burning = 0, c.prior = cprior)
# form 2
modelAll32 <- continue.mcmc(modelAll3, iter = 2000, burning = 0)
## End(No test)

## End(Not run)





