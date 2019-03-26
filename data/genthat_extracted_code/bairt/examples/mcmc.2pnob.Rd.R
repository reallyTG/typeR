library(bairt)


### Name: mcmc.2pnob
### Title: MCMC Estimation of the Two-Parameter Normal Ogive Model
### Aliases: mcmc.2pnob

### ** Examples

# data for model
data("MathTest")

# estimate model only for the first 500 examinees of the data MathTest
model2 <- mcmc.2pnob(MathTest[1:500,], iter = 400, burning = 100)
# study of chains convergence
check.plot(model2)
diagnostic.mcmc(model2)
parameter.plot(model2)
chain.study(model2, parameter = "b", chain = 14)
irc(model2, item = 3)

## No test: 
# continue the  MCMC
# form 1
initialValues <- final.values.mcmc(model2)
model21 <- mcmc.2pnob(MathTest[1:500,], initial.value = initialValues,
iter = 3000, burning = 0)

# form 2
model22 <- continue.mcmc(model2, iter = 3000, burning = 0)
## End(No test)

## End(Not run)




