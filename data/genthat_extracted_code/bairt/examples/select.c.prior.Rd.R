library(bairt)


### Name: select.c.prior
### Title: Select the c prior for the Three-Parameter Normal Ogive Model
### Aliases: select.c.prior

### ** Examples

# data for model
data("MathTest")

# selection of the prior for 5 response options
cprior <- select.c.prior(5)

# estimate model only for the first 500 examinees of the data MathTest
model3 <- mcmc.3pnob(MathTest[1:500,], iter = 300, burning = 0,
                    c.prior = cprior)

## End(Not run)




