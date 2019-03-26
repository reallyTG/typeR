library(bairt)


### Name: mcmc.3pnob
### Title: MCMC Estimation of the Three-Parameter Normal Ogive Model
### Aliases: mcmc.3pnob

### ** Examples

# data for model
data("MathTest")

# estimate model only for the first 500 examinees of the data MathTest
# selection of the prior for 5 response options
cprior <- select.c.prior(5)
# estimate model only for the first 500 examinees of the data MathTest
model3 <- mcmc.3pnob(MathTest[1:500,], iter = 300, burning = 0,
                    c.prior = cprior)

# study of chains convergence model3
check.plot(model3)
diagnostic.mcmc(model3)
parameter.plot(model3)
chain.study(model3, parameter = "a", chain = 15)
irc(model3, item = 1)

## No test: 
# continue the  MCMC
# form 1
initialValues2 <- final.values.mcmc(model3)
model31 <- mcmc.3pnob(MathTest[1:500,], initial.value = initialValues2,
                     iter = 3000, burning = 0, c.prior = cprior)
# form 2
model32 <- continue.mcmc(model3, iter = 3000, burning = 0)
## End(No test)

## End(Not run)




