library(bairt)


### Name: object.coda.bairt
### Title: Creating an mcmc.list for coda package
### Aliases: object.coda.bairt

### ** Examples

# data for model
data("MathTest")

# Only for the first 500 examinees of the data MathTest
# Two-Parameter Normal Ogive Model
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 400, burning = 100)

chain_a1 <- object.coda(model2, parameter = "a", chain = 1)
coda::gelman.plot(chain_a1)
coda::gelman.diag(chain_a1)
plot(chain_a1)

## No test: 
# For all examinees of the data MathTest
# Three-Parameter Normal Ogive Model
# selection of the prior for 5 response options
cprior <- select.c.prior(5)
model3 <- mcmc.3pnob(MathTest, iter = 3500, burning = 500,
                    c.prior = cprior, parts = 3)

chain_c1 <- object.coda(model3, parameter = "c", chain = 1)
coda::gelman.plot(chain_c1)
coda::gelman.diag(chain_c1)
plot(chain_c1)
## End(No test)

## End(Not run)





